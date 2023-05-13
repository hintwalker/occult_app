part of tauari_data_core;

abstract class LocalRelRepository<
    E extends SqliteGetable,
    L extends SqliteGetable,
    R extends SqliteGetable> extends LocalRepository<E> {
  Future<Iterable<E>> byLeftIdOnLocal(int leftId);
  Future<Iterable<E>> byRightIdOnLocal(int rightId);
  Future<Iterable<L>> leftDataOnLocal(int rightId);
  Future<Iterable<R>> rightDataOnLocal(int leftId);
  Stream<Iterable<E>> onByLeftIdOnLocal(int leftId);
  Stream<Iterable<E>> onByRightIdOnLocal(int rightId);
  Stream<Iterable<L?>> onLeftDataOnLocal(int rightId);
  Stream<Iterable<R?>> onRightDataOnLocal(int leftId);
  Future<int> connectOnLocal(int id, int leftId, int rightId);
  Future<int> disConnectOnLocal(int leftId, int rightId);
  Future<int> deleteByLeftIdOnLocal(int leftId);
  Future<int> deleteByRightIdOnLocal(int rightId);
  Future<E?> findByLeftAndRightIdOnLocal(int leftId, int rightId);
  int getLeftId(E entity);
  int getRightId(E entity);
}
