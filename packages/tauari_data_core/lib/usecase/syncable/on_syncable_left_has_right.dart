part of tauari_data_core;

abstract class OnSyncableLeftHasRight<
    E extends SyncableEntity,
    L extends SyncableEntity,
    R extends SyncableEntity,
    Q extends SyncableEntityCarrier<L, R>> {
  final SyncableRelRepository<E, L, R> repository;
  final Q Function(L, Iterable<R>) onCreateItem;
  const OnSyncableLeftHasRight(
      {required this.repository, required this.onCreateItem});

  Stream<Q?> call(String? uid, L left) => repository
      .onLeftHasRight(uid: uid, left: left, onCreateItem: onCreateItem)
      .map((event) => event == null ? null : event as Q);
}
