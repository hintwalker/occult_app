part of tauari_data_core;

abstract class OnSyncableOneManyData<E extends SyncableEntity,
    O extends SyncableEntity, Q extends SyncableEntityCarrier<O, E>> {
  final SyncableDependentRepository<E, O> repository;
  final Q Function(O, Iterable<E>) onCreateItem;
  const OnSyncableOneManyData(
      {required this.repository, required this.onCreateItem});

  Stream<Iterable<Q>> call(String? uid, [QueryArgs? queryArgs]) => repository
      .onOwnerHasThese(
          uid: uid, queryArgs: queryArgs, onCreateItem: onCreateItem)
      .map((event) => event.whereType());
}
