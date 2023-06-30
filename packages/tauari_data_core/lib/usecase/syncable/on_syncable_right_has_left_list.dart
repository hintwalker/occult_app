part of tauari_data_core;

abstract class OnSyncableRightHasLeftList<
    E extends SyncableEntity,
    L extends SyncableEntity,
    R extends SyncableEntity,
    Q extends SyncableEntityCarrier<R, L>> {
  final SyncableRelRepository<E, L, R> repository;
  final Q Function(R, Iterable<L>) onCreateItem;
  const OnSyncableRightHasLeftList(
      {required this.repository, required this.onCreateItem});

  Stream<Iterable<Q>> call(String? uid, [QueryArgs? queryArgs]) => repository
      .onRightHasLeftList(uid, onCreateItem)
      .map((event) => event.whereType());
}
