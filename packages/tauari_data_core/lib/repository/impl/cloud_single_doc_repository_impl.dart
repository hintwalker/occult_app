part of tauari_data_core;

class CloudSingleDocRepositoryImpl<E extends CloudGetable, M extends CloudModel>
    implements CloudSingleDocRepository<E> {
  final CloudSingleDocDataSource dataSource;
  final M Function(E) entityToModel;

  const CloudSingleDocRepositoryImpl(
    this.dataSource, {
    required this.entityToModel,
  });
  @override
  Future<bool> delete(String uid) => dataSource.delete(uid);

  @override
  Future<E?> doc(String uid) async =>
      await dataSource.doc(uid).then((value) => value?.toEntity());

  @override
  Stream<E?> onDoc(String uid) =>
      dataSource.onDoc(uid).map((event) => event?.toEntity());

  @override
  Future<bool> update(String uid, E doc) =>
      dataSource.update(uid, entityToModel(doc));
}
