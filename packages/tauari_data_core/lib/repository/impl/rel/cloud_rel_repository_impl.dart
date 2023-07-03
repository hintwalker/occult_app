part of tauari_data_core;

abstract class CloudRelRepositoryImpl<E extends CloudGetable,
        M extends CloudModel<E>, L extends CloudGetable, R extends CloudGetable>
    extends CloudRepositoryImpl<E, M> implements CloudRelRepository<E, L, R> {
  final String leftIdColumn;
  final String rightIdColumn;
  final CloudRepository<L> leftRepository;
  final CloudRepository<R> rightRepository;
  final E Function(int id, int leftId, int rightId) entityFromIds;

  CloudRelRepositoryImpl(
    super.dataSource, {
    required super.entityToModel,
    required this.leftIdColumn,
    required this.rightIdColumn,
    required this.leftRepository,
    required this.rightRepository,
    required this.entityFromIds,
  }) {
    leftRepository.addOnCloudDeletionTrigger((uid, docId) async =>
        await deleteByLeftIdOnCloud(uid, int.parse(docId)));
    rightRepository.addOnCloudDeletionTrigger((uid, docId) async =>
        await deleteByRightIdOnCloud(uid, int.parse(docId)));
  }

  @override
  Future<Iterable<E>> byLeftIdOnCloud(String uid, int leftId) async {
    return await dataCloud(
        uid,
        QueryArgs(
            firestoreWhere:
                CloudDataWhere(field: leftIdColumn, isEqualTo: leftId)));
  }

  @override
  Future<Iterable<E>> byRightIdOnCloud(String uid, int rightId) async {
    return await dataCloud(
        uid,
        QueryArgs(
            firestoreWhere:
                CloudDataWhere(field: rightIdColumn, isEqualTo: rightId)));
  }

  @override
  Future<Iterable<L>> leftDataOnCloud(String uid, int rightId) async {
    final rels = await byRightIdOnCloud(uid, rightId);
    final leftIds = rels.map((e) => getLeftId(e));
    final List<L> result = [];
    for (var id in leftIds) {
      final entity =
          await leftRepository.byIdOnCloud(uid: uid, docId: id.toString());
      if (entity != null) {
        result.add(entity);
      }
    }
    return result;
  }

  @override
  Future<Iterable<R>> rightDataOnCloud(String uid, int leftId) async {
    final rels = await byLeftIdOnCloud(uid, leftId);
    final rightIds = rels.map((e) => getRightId(e));
    final List<R> result = [];
    for (var id in rightIds) {
      final entity =
          await rightRepository.byIdOnCloud(uid: uid, docId: id.toString());
      if (entity != null) {
        result.add(entity);
      }
    }
    return result;
  }

  @override
  Stream<Iterable<E>> onByLeftIdOnCloud(String uid, int leftId) {
    return onCloud(
        uid,
        QueryArgs(
            firestoreWhere:
                CloudDataWhere(field: leftIdColumn, isEqualTo: leftId)));
  }

  @override
  Stream<Iterable<E>> onByRightIdOnCloud(String uid, int rightId) {
    return onCloud(
        uid,
        QueryArgs(
            firestoreWhere:
                CloudDataWhere(field: rightIdColumn, isEqualTo: rightId)));
  }

  @override
  Stream<Iterable<L?>> onLeftDataOnCloud(String uid, int rightId) {
    return onByRightIdOnCloud(uid, rightId)
        .asyncMap<Iterable<L?>>(
          (list) => Future.wait(
            list.map<Future<L?>>(
              (e) async => await leftRepository.byIdOnCloud(
                uid: uid,
                docId: getLeftId(e).toString(),
              ),
            ),
          ),
        )
        .asBroadcastStream(
          onCancel: ((subscription) => subscription.pause()),
          onListen: (subscription) => subscription.resume(),
        );
  }

  @override
  Stream<Iterable<R?>> onRightDataOnCloud(String uid, int leftId) {
    return onByLeftIdOnCloud(uid, leftId)
        .asyncMap<Iterable<R?>>((list) => Future.wait(list.map<Future<R?>>(
            (e) async => await rightRepository.byIdOnCloud(
                uid: uid, docId: getRightId(e).toString()))))
        .asBroadcastStream(
          onCancel: ((subscription) => subscription.pause()),
          onListen: (subscription) => subscription.resume(),
        );
  }

  @override
  Future<bool> connectOnCloud(
      {required String uid,
      required int id,
      required int leftId,
      required int rightId}) async {
    return await insert(uid, entityFromIds(id, leftId, rightId));
  }

  @override
  Future<int> deleteByLeftIdOnCloud(String uid, int leftId) async {
    return await dataSource.deleteWhere(
        uid,
        QueryArgs(
            firestoreWhere:
                CloudDataWhere(field: leftIdColumn, isEqualTo: leftId)));
  }

  @override
  Future<int> deleteByRightIdOnCloud(String uid, int rightId) async {
    return await dataSource.deleteWhere(
        uid,
        QueryArgs(
            firestoreWhere:
                CloudDataWhere(field: rightIdColumn, isEqualTo: rightId)));
  }

  @override
  Future<int> deleteOnCloud(String uid, int id) async {
    final exists = await dataSource.exist(uid, id.toString());
    if (!exists) {
      return 0;
    }
    final result = await dataSource.delete(uid, id.toString());
    return result ? 1 : 0;
  }

  @override
  Future<bool> disConnectOnCloud({
    required String uid,
    required int leftId,
    required int rightId,
  }) async {
    final item = await findByLeftAndRightIdOnCloud(
      uid: uid,
      leftId: leftId,
      rightId: rightId,
    );
    if (item == null) {
      return false;
    }
    return await deleteFromCloud(uid: uid, docId: item.docId);
  }

  @override
  Future<E?> findByLeftAndRightIdOnCloud({
    required String uid,
    required int leftId,
    required int rightId,
  }) async {
    final left = await byLeftIdOnCloud(uid, leftId);
    final leftVsRight = left.where((element) => getRightId(element) == rightId);
    return leftVsRight.isEmpty ? null : leftVsRight.first;
  }

  @override
  Future<bool> connectManyRightToLeft({
    required String uid,
    required Iterable<int> ids,
    required L left,
    required Iterable<R> rights,
  }) async {
    int i = 0;
    for (var right in rights) {
      await connectOnCloud(
        uid: uid,
        id: ids.elementAt(i),
        leftId: int.parse(left.docId),
        rightId: int.parse(right.docId),
      );
    }
    return true;
  }

  @override
  Future<bool> connectManyLeftToRight({
    required String uid,
    required Iterable<int> ids,
    required R right,
    required Iterable<L> lefts,
  }) async {
    int i = 0;
    for (var left in lefts) {
      await connectOnCloud(
        uid: uid,
        id: ids.elementAt(i),
        leftId: int.parse(left.docId),
        rightId: int.parse(right.docId),
      );
    }
    return true;
  }

  @override
  Future<bool> disConnectManyRightFromLeft({
    required String uid,
    required L left,
    required Iterable<R> rights,
  }) async {
    for (var right in rights) {
      await disConnectOnCloud(
        uid: uid,
        leftId: int.parse(left.docId),
        rightId: int.parse(right.docId),
      );
    }
    return true;
  }

  @override
  Future<bool> disConnectManyLeftFromRight({
    required String uid,
    required R right,
    required Iterable<L> lefts,
  }) async {
    for (var left in lefts) {
      await disConnectOnCloud(
        uid: uid,
        leftId: int.parse(left.docId),
        rightId: int.parse(right.docId),
      );
    }
    return true;
  }
}
