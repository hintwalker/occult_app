part of tauari_data_core;

abstract class SyncableDependentRepository<E extends SyncableEntity,
    O extends SyncableEntity> extends SyncableRepository<E> {
  const SyncableDependentRepository({
    required super.localRepository,
    required super.cloudRepository,
  });

  Future<O?> ownerOf(String? uid, int dependentId);
  Future<Iterable<E>> byOwnerId(
    String? uid,
    int ownerId,
    String? syncStatus,
  );
  Stream<Iterable<E>> onByOwnerId(
    String? uid,
    int ownerId,
    String? syncStatus,
  );
  Future<int> deleteByOwner(
    String? uid,
    int ownerId,
    String? syncStatus,
  );

  Stream<Iterable<SyncableEntityCarrier<O, E>>> onOwnerHasThese({
    String? uid,
    QueryArgs? queryArgs,
    required SyncableEntityCarrier<O, E> Function(O, Iterable<E>) onCreateItem,
  });

  Stream<Iterable<SyncableEntityPair<E, O>>> onOwnerAndThis({
    String? uid,
    QueryArgs? queryArgs,
    required SyncableEntityPair<E, O> Function(E p1, O p2) onCreateItem,
  });
}
