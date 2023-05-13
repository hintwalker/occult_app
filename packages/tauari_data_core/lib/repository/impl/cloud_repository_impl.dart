part of tauari_data_core;

abstract class CloudRepositoryImpl<T extends CloudGetable,
    M extends CloudModel<T>> implements CloudRepository<T> {
  final RemoteDataSource<M> dataSource;
  final M Function(T) entityToModel;

  CloudRepositoryImpl(this.dataSource, {required this.entityToModel});

  final List<Future<void> Function(String uid, String docId)>
      onCloudDeletionTriggers = [];
  @override
  void addOnCloudDeletionTrigger(
      Future<void> Function(String uid, String docId) trigger) {
    onCloudDeletionTriggers.add(trigger);
  }

  @override
  Future<T?> byIdOnCloud({required String uid, required String docId}) async {
    final model = await dataSource.byId(uid, docId);
    return model?.toEntity();
  }

  @override
  Future<bool> deleteFromCloud(
      {required String uid, required String docId}) async {
    final rows = await dataSource.delete(uid, docId);
    for (var trigger in onCloudDeletionTriggers) {
      await trigger(uid, docId);
    }
    return rows;
  }

  @override
  Stream<Iterable<T>> onCloud(String uid, [QueryArgs? queryArgs]) {
    return dataSource
        .onData(uid, queryArgs)
        .map((list) => list.map((e) => e.toEntity()));
  }

  @override
  Stream<int> onCloudCount(String uid) {
    return dataSource.onCount(uid);
  }

  @override
  Future<Iterable<T>> dataCloud(String uid, [QueryArgs? queryArgs]) async {
    final result = await dataSource.data(uid, queryArgs);
    return result.map((e) => e.toEntity());
  }

  @override
  Stream<T?> onByIdOnCloud({required String uid, required String docId}) {
    return dataSource.onById(uid, docId).map((event) => event?.toEntity());
  }

  @override
  Future<void> updateOnCloud(T item, String uid) async {
    await dataSource.update(uid, entityToModel(item));
  }

  @override
  Future<bool> insert(String uid, T item) async {
    return await dataSource.insert(uid, entityToModel(item));
  }
}
