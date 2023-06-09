part of tauari_data_core;

abstract class Upload<E extends SyncableEntity, R extends SyncableRepository> {
  final R repository;

  Upload(this.repository);
  Future<void> call(String uid, E entity) async {
    await repository.upload(uid, entity);
  }
}
