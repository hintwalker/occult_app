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
  Future<Iterable<L>> leftData(String? uid, R right);
  Future<Iterable<R>> rightData(String? uid, L left);
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
  Future<int> deleteByLeftId({
    required String? uid,
    required int leftId,
  });
  Future<int> deleteByRightId({
    required String? uid,
    required int rightId,
  });

  Stream<Iterable<SyncableEntityCarrier<R, L>>> onRightHasLeftList(String? uid,
      SyncableEntityCarrier<R, L> Function(R, Iterable<L>) onCreateItem);
  Stream<Iterable<SyncableEntityCarrier<L, R>>> onLeftHasRightList(String? uid,
      SyncableEntityCarrier<L, R> Function(L, Iterable<R>) onCreateItem);
  Stream<SyncableEntityCarrier<L, R>?> onLeftHasRight({
    required String? uid,
    required L left,
    required SyncableEntityCarrier<L, R> Function(L, Iterable<R>) onCreateItem,
  });

  Stream<SyncableEntityCarrier<R, L>?> onRightHasLeft({
    required String? uid,
    required R right,
    required SyncableEntityCarrier<R, L> Function(R, Iterable<L>) onCreateItem,
  });

  Future<void> connectLeftToRight({
    required String? uid,
    required R right,
    required Iterable<L> lefts,
  });

  Future<void> disConnectLeftFromRight({
    required String? uid,
    required R right,
    required Iterable<L> lefts,
  });

  Future<void> connectRightToLeft({
    required String? uid,
    required L left,
    required Iterable<R> rights,
  });

  Future<void> disConnectRightFromLeft({
    required String? uid,
    required L left,
    required Iterable<R> rights,
  });
}
