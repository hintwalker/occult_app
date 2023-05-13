part of tauari_data_core;

abstract class LocalRelRepositoryImpl<
        E extends SqliteGetable,
        M extends LocalModel<E>,
        L extends SqliteGetable,
        R extends SqliteGetable> extends LocalRepositoryImpl<E, M>
    implements LocalRelRepository<E, L, R> {
  final String leftIdColumn;
  final String rightIdColumn;
  final LocalRepository<L> leftRepository;
  final LocalRepository<R> rightRepository;

  final E Function(int id, int leftId, int rightId) entityFromIds;

  const LocalRelRepositoryImpl(
    super.dataSource, {
    required super.entityToModel,
    required this.leftIdColumn,
    required this.rightIdColumn,
    required this.leftRepository,
    required this.rightRepository,
    required this.entityFromIds,
  });

  @override
  Future<Iterable<E>> byLeftIdOnLocal(int leftId) async {
    return await dataLocal(
        QueryArgs(where: '$leftIdColumn = ?', whereArgs: [leftId]));
  }

  @override
  Future<Iterable<E>> byRightIdOnLocal(int rightId) async {
    return await dataLocal(
        QueryArgs(where: '$rightIdColumn = ?', whereArgs: [rightId]));
  }

  @override
  Future<Iterable<L>> leftDataOnLocal(int rightId) async {
    final rels = await byRightIdOnLocal(rightId);
    final leftIds = rels.map((e) => getLeftId(e));
    final List<L> result = [];
    for (var id in leftIds) {
      final entity = await leftRepository.byIdOnLocal(id);
      if (entity != null) {
        result.add(entity);
      }
    }
    return result;
  }

  @override
  Future<Iterable<R>> rightDataOnLocal(int leftId) async {
    final rels = await byLeftIdOnLocal(leftId);
    final rightIds = rels.map((e) => getRightId(e));
    final List<R> result = [];
    for (var id in rightIds) {
      final entity = await rightRepository.byIdOnLocal(id);
      if (entity != null) {
        result.add(entity);
      }
    }
    return result;
  }

  @override
  Stream<Iterable<E>> onByRightIdOnLocal(int rightId) {
    return onLocal(
        QueryArgs(where: '$rightIdColumn = ?', whereArgs: [rightId]));
  }

  @override
  Stream<Iterable<E>> onByLeftIdOnLocal(int leftId) {
    return onLocal(QueryArgs(where: '$leftIdColumn = ?', whereArgs: [leftId]));
  }

  @override
  Stream<Iterable<L?>> onLeftDataOnLocal(int rightId) {
    return onByRightIdOnLocal(rightId)
        .asyncMap<Iterable<L?>>((list) => Future.wait(list.map<Future<L?>>(
            (e) async => await leftRepository.byIdOnLocal(getLeftId(e)))))
        .asBroadcastStream(
          onCancel: ((subscription) => subscription.pause()),
          onListen: (subscription) => subscription.resume(),
        );
  }

  @override
  Stream<Iterable<R?>> onRightDataOnLocal(int leftId) {
    return onByLeftIdOnLocal(leftId)
        .asyncMap<Iterable<R?>>((list) => Future.wait(list.map<Future<R?>>(
            (e) async => await rightRepository.byIdOnLocal(getRightId(e)))))
        .asBroadcastStream(
          onCancel: ((subscription) => subscription.pause()),
          onListen: (subscription) => subscription.resume(),
        );
  }

  @override
  Future<int> connectOnLocal(int id, int leftId, int rightId) async {
    return await insertToLocal(entityFromIds(id, leftId, rightId));
  }

  @override
  Future<int> deleteByLeftIdOnLocal(int leftId) async {
    return await dataSource.deleteWhere('$leftIdColumn = ?', [leftId]);
  }

  @override
  Future<int> deleteByRightIdOnLocal(int rightId) async {
    return await dataSource.deleteWhere('$rightIdColumn = ?', [rightId]);
  }

  @override
  Future<int> disConnectOnLocal(int leftId, int rightId) async {
    final item = await findByLeftAndRightIdOnLocal(leftId, rightId);
    if (item == null) {
      return 0;
    }
    return await deleteFromLocal(item.primaryKey);
  }

  @override
  Future<E?> findByLeftAndRightIdOnLocal(int leftId, int rightId) async {
    final item = await dataLocal(QueryArgs(
        where: '$leftIdColumn = ? AND $rightIdColumn = ?',
        whereArgs: [leftId, rightId]));
    return item.isEmpty ? null : item.first;
  }
}
