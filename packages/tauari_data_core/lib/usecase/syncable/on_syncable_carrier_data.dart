part of tauari_data_core;

abstract class OnSyncableCarrierData<
    E extends SyncableEntity,
    L extends SyncableEntity,
    R extends SyncableEntity,
    Q extends SyncableEntityCarrier<L, R>> {
  final SyncableRelRepository<E, L, R> repository;
  final Q Function(L, Iterable<R>) onCreateItem;
  const OnSyncableCarrierData(
      {required this.repository, required this.onCreateItem});

  Stream<Iterable<Q>> call(String? uid, [QueryArgs? queryArgs]) => repository
      .onLeftHasRight(uid, onCreateItem)
      .map((event) => event.whereType());
}
