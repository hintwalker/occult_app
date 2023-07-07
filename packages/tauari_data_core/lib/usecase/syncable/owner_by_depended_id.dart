part of tauari_data_core;

class OwnerByDependentId<E extends SyncableEntity, O extends SyncableEntity> {
  const OwnerByDependentId(this.repository);
  final SyncableDependentRepository<E, O> repository;
  Future<O?> call(String? uid, int dependentId) =>
      repository.ownerOf(uid, dependentId);
}
