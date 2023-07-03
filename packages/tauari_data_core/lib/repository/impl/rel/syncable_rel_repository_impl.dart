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

  /// Thực hiện kết nối giữa [L] và [R]
  ///
  /// Nếu [L] hoặc [R] chỉ có trên local thì không thực hiện kết nối trên cloud.
  @override
  Future connect({String? uid, required L left, required R right}) async {
    final id = await localRelRepository.connectOnLocal(left.id, right.id);
    if (onlyOnLocal(uid: uid, syncStatus: left.syncStatus) ||
        onlyOnLocal(uid: uid, syncStatus: right.syncStatus)) {
      return;
    }
    await cloudRelRepository.connectOnCloud(
      uid: uid!,
      id: id,
      leftId: left.id,
      rightId: right.id,
    );
  }

  /// Xóa dữ liệu của bảng quan hệ theo id của [L]
  ///
  /// - Việc xóa dữ liệu đầu tiên thực hiện trên local,
  /// Nếu user đã đăng nhập (uid != null) thì xóa dữ liệu trên cloud.
  /// - Vì Firebase có sử dụng chế độ offline, nên việc xóa dữ liệu trên cloud
  /// có thể thực hiện được khi không có kết nối internet.
  /// Việc xóa thực sự trên cloud sẽ được thực hiện khi có kết nối internet lại.
  @override
  Future<int> deleteByLeftId({
    required String? uid,
    required int leftId,
  }) async {
    final rows = await localRelRepository.deleteByLeftIdOnLocal(leftId);
    if (uid != null) {
      await cloudRelRepository.deleteByLeftIdOnCloud(uid, leftId);
    }
    return rows;
  }

  /// Xóa dữ liệu của bảng quan hệ theo id của [R]
  ///
  /// - Việc xóa dữ liệu đầu tiên thực hiện trên local,
  /// Nếu user đã đăng nhập (uid != null) thì xóa dữ liệu trên cloud.
  /// - Vì Firebase có sử dụng chế độ offline, nên việc xóa dữ liệu trên cloud
  /// có thể thực hiện được khi không có kết nối internet.
  /// Việc xóa thực sự trên cloud sẽ được thực hiện khi có kết nối internet lại.
  @override
  Future<int> deleteByRightId({
    required String? uid,
    required int rightId,
  }) async {
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
  Future<Iterable<L>> leftData(String? uid, R right) async {
    if (uid == null) {
      final result = await localRelRepository.leftDataOnLocal(right.id);
      return result.whereType();
    }
    final relsLocal = await localRelRepository.byRightIdOnLocal(right.id);
    final leftIdsLocal = relsLocal.map((e) => localRelRepository.getLeftId(e));

    final relsCloud = await cloudRelRepository.byRightIdOnCloud(uid, right.id);
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
  Future<Iterable<R>> rightData(String? uid, L left) async {
    if (uid == null) {
      return await localRelRepository.rightDataOnLocal(left.id);
    }
    final relsLocal = await localRelRepository.byLeftIdOnLocal(left.id);
    final rightIdsLocal =
        relsLocal.map((e) => localRelRepository.getRightId(e));

    final relsCloud = await cloudRelRepository.byLeftIdOnCloud(uid, left.id);
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
  }

  /// Thực hiện ngắt kết nối giữa [L] và [R]
  ///
  /// Nếu [L] hoặc [R] chỉ có trên local thì không thực hiện ngắt kết nối trên cloud
  @override
  Future disConnect({String? uid, required L left, required R right}) async {
    await localRelRepository.disConnectOnLocal(left.id, right.id);
    if (onlyOnLocal(uid: uid, syncStatus: left.syncStatus) ||
        onlyOnLocal(uid: uid, syncStatus: right.syncStatus)) {
      return;
    }
    await cloudRelRepository.disConnectOnCloud(
        uid: uid!, leftId: left.id, rightId: right.id);
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
                final lefts = await leftData(uid, right);
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
                final rights = await rightData(uid, left);
                return onCreateItem(left, rights);
              },
            )));
    // return onCreateItem(left, rights);
  }

  @override
  Stream<SyncableEntityCarrier<L, R>?> onLeftHasRight(
      {required String? uid,
      required L left,
      required SyncableEntityCarrier<L, R> Function(L p1, Iterable<R> p2)
          onCreateItem}) {
    return leftRepository
        .onById(
      uid: uid,
      docId: left.id,
      syncStatus: left.syncStatus,
    )
        .asyncMap((event) async {
      if (event == null) {
        return Future.value(null);
      }
      final rights = await rightData(uid, event);
      return onCreateItem(event, rights);
    });
  }

  /// Tìm đối tượng gồm [R] cho trước chứa theo tất các [L]
  ///
  /// Nếu [R] chỉ có trên local thì chỉ tìm đối tượng trên local,
  /// các [L] thì tìm cả trên local và cloud.
  @override
  Stream<SyncableEntityCarrier<R, L>?> onRightHasLeft(
      {required String? uid,
      required R right,
      required SyncableEntityCarrier<R, L> Function(R p1, Iterable<L> p2)
          onCreateItem}) {
    return rightRepository
        .onById(
      uid: uid,
      docId: right.id,
      syncStatus: right.syncStatus,
    )
        .asyncMap((event) async {
      if (event == null) {
        return Future.value(null);
      }
      final lefts = await leftData(uid, event);
      return onCreateItem(event, lefts);
    });
  }

  @override
  Future<void> connectLeftToRight({
    required String? uid,
    required R right,
    required Iterable<L> lefts,
  }) async {
    List<int> ids = [];
    if (onlyOnLocal(uid: uid, syncStatus: right.syncStatus)) {
      ids = await localRelRepository.connectManyLeftToRight(right, lefts);
    } else {
      await cloudRelRepository.connectManyLeftToRight(
        uid: uid!,
        ids: ids,
        right: right,
        lefts: lefts,
      );
    }
  }

  @override
  Future<void> disConnectLeftFromRight({
    required String? uid,
    required R right,
    required Iterable<L> lefts,
  }) async {
    if (onlyOnLocal(uid: uid, syncStatus: right.syncStatus)) {
      await localRelRepository.disConnectManyLeftFromRight(right, lefts);
    } else {
      await cloudRelRepository.disConnectManyLeftFromRight(
        uid: uid!,
        right: right,
        lefts: lefts,
      );
    }
  }

  /// Thực hiện kết nối nhiều [R] vào 1 [L]
  ///
  /// Nếu L chỉ có trên local thì chỉ thực hiện kết nối trên local
  @override
  Future<void> connectRightToLeft({
    required String? uid,
    required L left,
    required Iterable<R> rights,
  }) async {
    List<int> ids = [];
    if (onlyOnLocal(uid: uid, syncStatus: left.syncStatus)) {
      ids = await localRelRepository.connectManyRightToLeft(left, rights);
    } else {
      await cloudRelRepository.connectManyRightToLeft(
        uid: uid!,
        ids: ids,
        left: left,
        rights: rights,
      );
    }
  }

  @override
  Future<void> disConnectRightFromLeft({
    required String? uid,
    required L left,
    required Iterable<R> rights,
  }) async {
    if (onlyOnLocal(uid: uid, syncStatus: left.syncStatus)) {
      await localRelRepository.disConnectManyRightFromLeft(left, rights);
    } else {
      await cloudRelRepository.disConnectManyRightFromLeft(
        uid: uid!,
        left: left,
        rights: rights,
      );
    }
  }
}
