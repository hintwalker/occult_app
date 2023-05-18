part of tauari_data_core;

abstract class OnSyncableData<T extends SyncableEntity> {
  final SyncableRepository<T> repository;
  const OnSyncableData(this.repository);

  Stream<Iterable<T>> call(String? uid, [QueryArgs? queryArgs]) =>
      repository.onEveryWhere(uid, queryArgs);
}
