part of tauari_data_core;

abstract class SyncableDependentRepository<E extends SyncableEntity,
    O extends SyncableEntity> extends SyncableRepository<E> {
  const SyncableDependentRepository({
    required super.localRepository,
    required super.cloudRepository,
  });

  Future<O?> owner(String? uid, int dependentId);
  Future<Iterable<E>> byOwnerId(String? uid, int ownerId);
  Stream<Iterable<E>> onByOwnerId(String? uid, int ownerId);
  Future<int> deleteByOwner(String? uid, int ownerId);

  Stream<Iterable<SyncableEntityCarrier<O, E>>> onOwnerHasThese(String? uid,
      SyncableEntityCarrier<O, E> Function(O, Iterable<E>) onCreateItem);

  Stream<Iterable<SyncableEntityCarrier<O, E>>> onOwnerAndThis(String? uid,
      SyncableEntityCarrier<O, E> Function(O p1, E p2) onCreateItem);
}
