part of tauari_data_core;

abstract class DeleteEntityForever<T extends SyncableEntity,
    R extends SyncableRepository> {
  final R repository;
  const DeleteEntityForever(this.repository);

  Future<void> call(String uid, T entity) async {
    await repository.deleteEveryWhere(uid, entity);
    // await repository.deleteFromCloud(uid: uid, docId: entity.keyId);
    // await repository.deleteFromLocal(entity.id);
  }
}
