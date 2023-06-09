part of tauari_data_core;

abstract class Download<E extends SyncableEntity,
    R extends SyncableRepository> {
  final R repository;

  Download(this.repository);
  Future<void> call(String uid, E entity) async {
    await repository.download(uid, entity);
  }
}
