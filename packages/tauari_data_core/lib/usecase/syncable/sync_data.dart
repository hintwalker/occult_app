part of tauari_data_core;

class SyncData<E extends SyncableEntity, R extends SyncableRepository> {
  const SyncData(this.repository);
  final R repository;
  Future<void> call(String? uid) => repository.sync(uid);
}
