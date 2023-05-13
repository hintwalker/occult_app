part of tauari_data_core;

abstract class CloudRelRepository<E extends CloudGetable,
    L extends CloudGetable, R extends CloudGetable> extends CloudRepository<E> {
  Future<Iterable<E>> byLeftIdOnCloud(String uid, int leftId);
  Future<Iterable<E>> byRightIdOnCloud(String uid, int rightId);
  Future<Iterable<L>> leftDataOnCloud(String uid, int rightId);
  Future<Iterable<R>> rightDataOnCloud(String uid, int leftId);
  Stream<Iterable<E>> onByLeftIdOnCloud(String uid, int leftId);
  Stream<Iterable<E>> onByRightIdOnCloud(String uid, int rightId);
  Stream<Iterable<L?>> onLeftDataOnCloud(String uid, int rightId);
  Stream<Iterable<R?>> onRightDataOnCloud(String uid, int leftId);
  Future<bool> connectOnCloud({
    required String uid,
    required int id,
    required int leftId,
    required int rightId,
  });
  Future<bool> disConnectOnCloud({
    required String uid,
    required int leftId,
    required int rightId,
  });
  Future<int> deleteOnCloud(String uid, int id);
  Future<int> deleteByLeftIdOnCloud(String uid, int leftId);
  Future<int> deleteByRightIdOnCloud(String uid, int rightId);
  Future<E?> findByLeftAndRightIdOnCloud({
    required String uid,
    required int leftId,
    required int rightId,
  });
  int getLeftId(E entity);
  int getRightId(E entity);
}
