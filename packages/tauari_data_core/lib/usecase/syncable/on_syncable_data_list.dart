part of tauari_data_core;

abstract class OnSyncableDataList<T extends SyncableEntity> {
  final SyncableRepository<T> repository;
  const OnSyncableDataList(this.repository);

  Stream<Iterable<T>> call(String? uid, [QueryArgs? queryArgs]) =>
      repository.onEveryWhere(uid, queryArgs);
}
