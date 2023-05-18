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
    required int leftId,
    required int rightId,
  });
  Future disConnect({
    String? uid,
    required int leftId,
    required int rightId,
  });
  // Future<int> deleteRel(String? uid, int id);
  Future<int> deleteByLeftId(String? uid, int leftId);
  Future<int> deleteByRightId(String? uid, int rightId);

  Stream<Iterable<SyncableEntityCarrier<R, L>>> onRightHasLeft(String? uid,
      SyncableEntityCarrier<R, L> Function(R, Iterable<L>) onCreateItem);
  Stream<Iterable<SyncableEntityCarrier<L, R>>> onLeftHasRight(String? uid,
      SyncableEntityCarrier<L, R> Function(L, Iterable<R>) onCreateItem);
}
