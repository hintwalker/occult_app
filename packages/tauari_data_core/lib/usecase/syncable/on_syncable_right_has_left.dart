part of tauari_data_core;

abstract class OnSyncableRightHasLeft<
    E extends SyncableEntity,
    L extends SyncableEntity,
    R extends SyncableEntity,
    Q extends SyncableEntityCarrier<R, L>> {
  final SyncableRelRepository<E, L, R> repository;
  final Q Function(R, Iterable<L>) onCreateItem;
  const OnSyncableRightHasLeft(
      {required this.repository, required this.onCreateItem});

  Stream<Q?> call(String? uid, int leftId) => repository
      .onRightHasLeft(uid: uid, rightId: leftId, onCreateItem: onCreateItem)
      .map((event) => event == null ? null : event as Q);
}
