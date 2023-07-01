part of tauari_data_core;

abstract class SyncableRelRepository<
    E extends SyncableEntity,
    L extends SyncableEntity,
    R extends SyncableEntity> extends SyncableRepository<E> {
  SyncableRelRepository(
    LocalRelRepository<E, L, R> localRelRepository,
    CloudRelRepository<E, L, R> cloudRelRepository,
  ) : super(
            localRepository: localRelRepository,
            cloudRepository: cloudRelRepository);

  Future<Iterable<E>> byLeftId(String? uid, int leftId);
  Future<Iterable<E>> byRightId(String? uid, int rightId);
  Future<Iterable<L>> leftData(String? uid, int rightId);
  Future<Iterable<R>> rightData(String? uid, int leftId);
  Stream<Iterable<E>> onByLeftId(String? uid, int leftId);
  Stream<Iterable<E>> onByRightId(String? uid, int rightId);
  Stream<Iterable<L>> onLeftData(String? uid, int rightId);
  Stream<Iterable<R>> onRightData(String? uid, int leftId);
  Future connect({
    String? uid,
    required L left,
    required R right,
  });
  Future disConnect({
    String? uid,
    required L left,
    required R right,
  });
  // Future<int> deleteRel(String? uid, int id);
  Future<int> deleteByLeftId(String? uid, int leftId, String syncStatus);
  Future<int> deleteByRightId(String? uid, int rightId, String syncStatus);

  Stream<Iterable<SyncableEntityCarrier<R, L>>> onRightHasLeftList(String? uid,
      SyncableEntityCarrier<R, L> Function(R, Iterable<L>) onCreateItem);
  Stream<Iterable<SyncableEntityCarrier<L, R>>> onLeftHasRightList(String? uid,
      SyncableEntityCarrier<L, R> Function(L, Iterable<R>) onCreateItem);
  Stream<SyncableEntityCarrier<L, R>?> onLeftHasRight({
    String? uid,
    required int leftId,
    required SyncableEntityCarrier<L, R> Function(L, Iterable<R>) onCreateItem,
  });

  Stream<SyncableEntityCarrier<R, L>?> onRightHasLeft({
    String? uid,
    required int rightId,
    required SyncableEntityCarrier<R, L> Function(R, Iterable<L>) onCreateItem,
  });

  Future<void> connectLeftToRight({
    String? uid,
    required R right,
    required Iterable<L> lefts,
  });

  Future<void> disConnectLeftFromRight({
    String? uid,
    required R right,
    required Iterable<L> lefts,
  });

  Future<void> connectRightToLeft({
    String? uid,
    required L left,
    required Iterable<R> rights,
  });

  Future<void> disConnectRightFromLeft({
    String? uid,
    required L left,
    required Iterable<R> rights,
  });
}
