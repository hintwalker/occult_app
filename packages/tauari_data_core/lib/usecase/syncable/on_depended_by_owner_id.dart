part of tauari_data_core;

class OnDependedByOwnerId<E extends SyncableEntity, O extends SyncableEntity> {
  const OnDependedByOwnerId(this.repository);
  final SyncableDependentRepository<E, O> repository;
  Stream<Iterable<E>> call(
    String? uid,
    int ownerId,
    String? syncStatus,
  ) =>
      repository.onByOwnerId(
        uid,
        ownerId,
        syncStatus,
      );
}
