part of tauari_data_core;

abstract class OnSyncablePairData<E extends SyncableEntity,
    O extends SyncableEntity, P extends SyncableEntityPair<E, O>> {
  final SyncableDependentRepository<E, O> repository;
  final P Function(E, O) onCreateItem;
  const OnSyncablePairData({
    required this.repository,
    required this.onCreateItem,
  });

  Stream<Iterable<P>> call({String? uid, QueryArgs? queryArgs}) => repository
      .onOwnerAndThis(
        uid: uid,
        queryArgs: queryArgs,
        onCreateItem: onCreateItem,
      )
      .map((event) => event.whereType());
}
