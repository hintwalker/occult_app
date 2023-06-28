part of tauari_data_core;

class SyncableRelRepositoryImpl<
        E extends SyncableEntity,
        M extends SyncableModel<E>,
        L extends SyncableEntity,
        R extends SyncableEntity> extends SyncableRepositoryImpl<E, M>
    implements SyncableRelRepository<E, L, R> {
  final SyncableRepository<L> leftRepository;
  final SyncableRepository<R> rightRepository;
  final LocalRelRepository<E, L, R> localRelRepository;
  final CloudRelRepository<E, L, R> cloudRelRepository;
  SyncableRelRepositoryImpl({
    required this.cloudRelRepository,
    required this.localRelRepository,
    required this.leftRepository,
    required this.rightRepository,
  }) : super(
            localRepository: localRelRepository,
            cloudRepository: cloudRelRepository);

  @override
  Future connect(
      {String? uid, required int leftId, required int rightId}) async {
    final id = DateTime.now().millisecondsSinceEpoch;
    await localRelRepository.connectOnLocal(id, leftId, rightId);
    if (uid != null) {
      await cloudRelRepository.connectOnCloud(
          uid: uid, id: id, leftId: leftId, rightId: rightId);
    }
  }

  // @override
  // Future<int> deleteRel(String? uid, int id) async {
  //   final rows = await localRelRepository.deleteOnLocal(id);
  //   if (uid != null) {
  //     await deleteOnCloud(uid, id);
  //   }
  //   return rows;
  // }

  @override
  Future<int> deleteByLeftId(String? uid, int leftId) async {
    final rows = await localRelRepository.deleteByLeftIdOnLocal(leftId);
    if (uid != null) {
      await cloudRelRepository.deleteByLeftIdOnCloud(uid, leftId);
    }
    return rows;
  }

  @override
  Future<int> deleteByRightId(String? uid, int rightId) async {
    final rows = await localRelRepository.deleteByRightIdOnLocal(rightId);
    if (uid != null) {
      await cloudRelRepository.deleteByRightIdOnCloud(uid, rightId);
    }
    return rows;
  }

  @override
  Future<Iterable<E>> byLeftId(String? uid, int leftId) async {
    final local = await localRelRepository.byLeftIdOnLocal(leftId);
    if (uid == null) {
      return local.whereType();
    }
    final cloud = await cloudRelRepository.byLeftIdOnCloud(uid, leftId);
    return mergeCloudToLocal(uid: uid, local: local, cloud: cloud);
  }

  @override
  Future<Iterable<E>> byRightId(String? uid, int rightId) async {
    final local = await localRelRepository.byRightIdOnLocal(rightId);
    if (uid == null) {
      return local.whereType();
    }
    final cloud = await cloudRelRepository.byRightIdOnCloud(uid, rightId);
    return mergeCloudToLocal(uid: uid, local: local, cloud: cloud);
  }

  @override
  Future<Iterable<L>> leftData(String? uid, int rightId) async {
    if (uid == null) {
      final result = await localRelRepository.leftDataOnLocal(rightId);
      return result.whereType();
    }
    final relsLocal = await localRelRepository.byRightIdOnLocal(rightId);
    final leftIdsLocal = relsLocal.map((e) => localRelRepository.getLeftId(e));

    final relsCloud = await cloudRelRepository.byRightIdOnCloud(uid, rightId);
    final leftIdsCloud = relsCloud.map((e) => cloudRelRepository.getLeftId(e));

    final unionIds = leftIdsLocal.toSet().union(leftIdsCloud.toSet());
    final List<L> result = [];
    for (var id in unionIds) {
      final entity = await leftRepository.byId(uid: uid, docId: id);
      if (entity != null) {
        result.add(entity);
      }
    }
    return result;
  }

  @override
  Stream<Iterable<E>> onByLeftId(String? uid, int leftId) {
    final local = localRelRepository.onByLeftIdOnLocal(leftId);
    if (uid == null) {
      return local;
    }
    final cloud = cloudRelRepository.onByLeftIdOnCloud(uid, leftId);
    final result = Rx.combineLatest2(
      local,
      cloud,
      (a, b) => mergeCloudToLocal(uid: uid, local: a, cloud: b),
    ).asBroadcastStream(
        onCancel: (subscription) => subscription.pause(),
        onListen: (subscription) => subscription.resume());
    return result;
  }

  @override
  Stream<Iterable<E>> onByRightId(String? uid, int rightId) {
    final local = localRelRepository.onByRightIdOnLocal(rightId);
    if (uid == null) {
      return local;
    }
    final cloud = cloudRelRepository.onByRightIdOnCloud(uid, rightId);
    final result = Rx.combineLatest2(
      local,
      cloud,
      (a, b) => mergeCloudToLocal(uid: uid, local: a, cloud: b),
    ).asBroadcastStream(
        onCancel: (subscription) => subscription.pause(),
        onListen: (subscription) => subscription.resume());
    return result;
  }

  @override
  Stream<Iterable<L>> onLeftData(String? uid, int rightId) {
    final local = localRelRepository
        .onLeftDataOnLocal(rightId)
        .map((event) => event.whereType<L>());
    if (uid == null) {
      return local;
    }
    final cloud = cloudRelRepository
        .onLeftDataOnCloud(uid, rightId)
        .map((event) => event.whereType<L>());
    final result = Rx.combineLatest2(
      local,
      cloud,
      (a, b) => mergeCloudToLocal(uid: uid, local: a, cloud: b),
    ).asBroadcastStream(
        onCancel: (subscription) => subscription.pause(),
        onListen: (subscription) => subscription.resume());
    return result;
  }

  @override
  Stream<Iterable<R>> onRightData(String? uid, int leftId) {
    final local = localRelRepository
        .onRightDataOnLocal(leftId)
        .map((event) => event.whereType<R>());
    if (uid == null) {
      return local;
    }
    final cloud = cloudRelRepository
        .onRightDataOnCloud(uid, leftId)
        .map((event) => event.whereType<R>());
    final result = Rx.combineLatest2(
      local,
      cloud,
      (a, b) => mergeCloudToLocal(uid: uid, local: a, cloud: b),
    ).asBroadcastStream(
        onCancel: (subscription) => subscription.pause(),
        onListen: (subscription) => subscription.resume());
    return result;
  }

  @override
  Future<Iterable<R>> rightData(String? uid, int leftId) async {
    if (uid == null) {
      return await localRelRepository.rightDataOnLocal(leftId);
    }
    final relsLocal = await localRelRepository.byLeftIdOnLocal(leftId);
    final rightIdsLocal =
        relsLocal.map((e) => localRelRepository.getRightId(e));

    final relsCloud = await cloudRelRepository.byLeftIdOnCloud(uid, leftId);
    final rightIdsCloud =
        relsCloud.map((e) => cloudRelRepository.getRightId(e));

    final unionIds = rightIdsLocal.toSet().union(rightIdsCloud.toSet());
    final List<R> result = [];
    for (var id in unionIds) {
      final entity = await rightRepository.byId(uid: uid, docId: id);
      if (entity != null) {
        result.add(entity);
      }
    }
    return result;
    // final local = await rightDataOnLocal(leftId);
    // if (uid == null) {
    //   return local;
    // }
    // final cloud = await rightDataOnCloud(uid, leftId);
    // return mergeCloudToLocal<R>(uid: uid, local: local, cloud: cloud);
  }

  @override
  Future disConnect(
      {String? uid, required int leftId, required int rightId}) async {
    await localRelRepository.disConnectOnLocal(leftId, rightId);
    if (uid != null) {
      await cloudRelRepository.disConnectOnCloud(
          uid: uid, leftId: leftId, rightId: rightId);
    }
  }

  @override
  Stream<Iterable<SyncableEntityCarrier<R, L>>> onRightHasLeftList(
      String? uid,
      SyncableEntityCarrier<R, L> Function(R right, Iterable<L> lefts)
          onCreateItem) {
    return rightRepository
        .onEveryWhere(uid)
        .asyncMap((event) async => await Future.wait(event.map(
              (right) async {
                final lefts = await leftData(uid, right.id);
                return onCreateItem(right, lefts);
              },
            )));
  }

  @override
  Stream<Iterable<SyncableEntityCarrier<L, R>>> onLeftHasRightList(
      String? uid,
      SyncableEntityCarrier<L, R> Function(L left, Iterable<R> rights)
          onCreateItem) {
    return leftRepository
        .onEveryWhere(uid)
        // .asyncMap((event) async {
        //   final rightsFuture = event.map((left) => rightData(uid, left.id));
        //   final List<EntityCarrier<L, R>> result = [];
        //   for (var future in rightsFuture) {
        //     final rights = await future;
        //     result.add(onCreateItem(left, rights));
        //   }
        // });
        .asyncMap((event) async => await Future.wait(event.map(
              (left) async {
                final rights = await rightData(uid, left.id);
                return onCreateItem(left, rights);
              },
            )));
    // return onCreateItem(left, rights);
  }

  @override
  Stream<SyncableEntityCarrier<L, R>?> onLeftHasRight(
      {String? uid,
      required int leftId,
      required SyncableEntityCarrier<L, R> Function(L p1, Iterable<R> p2)
          onCreateItem}) {
    return leftRepository
        .onById(uid: uid, docId: leftId)
        .asyncMap((event) async {
      if (event == null) {
        return Future.value(null);
      }
      final rights = await rightData(uid, event.id);
      return onCreateItem(event, rights);
    }
//         async {
//           Future.wait(
// if (event == null) {
//         return null;
//       }
//       final rights = await rightData(uid, event.id);
//       return onCreateItem(event, rights);
//           )

//     }
            );
  }

  @override
  Stream<SyncableEntityCarrier<R, L>?> onRightHasLeft(
      {String? uid,
      required int rightId,
      required SyncableEntityCarrier<R, L> Function(R p1, Iterable<L> p2)
          onCreateItem}) {
    return rightRepository
        .onById(uid: uid, docId: rightId)
        .asyncMap((event) async {
      if (event == null) {
        return Future.value(null);
      }
      final lefts = await leftData(uid, event.id);
      return onCreateItem(event, lefts);
    });
  }
}
