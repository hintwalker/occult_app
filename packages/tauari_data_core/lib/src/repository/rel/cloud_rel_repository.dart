import '../../entity/cloud_getable.dart';
import '../cloud_repository.dart';

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
    required bool refresh,
  });
  Future<bool> connectManyRightToLeft({
    required String uid,
    required Iterable<int> ids,
    required L left,
    required Iterable<R> rights,
    required bool refresh,
  });
  Future<bool> connectManyLeftToRight({
    required String uid,
    required Iterable<int> ids,
    required R right,
    required Iterable<L> lefts,
    required bool refresh,
  });
  Future<String?> disConnectOnCloud({
    required String uid,
    required int leftId,
    required int rightId,
    required bool refresh,
  });
  Future<Iterable<String>> disConnectManyRightFromLeft({
    required String uid,
    required L left,
    required Iterable<R> rights,
    required bool refresh,
  });
  Future<Iterable<String>> disConnectManyLeftFromRight({
    required String uid,
    required R right,
    required Iterable<L> lefts,
    required bool refresh,
  });
  // Future<int> deleteOnCloud(
  //   String uid,
  //   int id,
  //   bool refresh,
  // );
  Future<Iterable<String>> deleteByLeftIdOnCloud(
    String uid,
    int leftId,
    bool refresh,
  );
  Future<Iterable<String>> deleteByRightIdOnCloud(
    String uid,
    int rightId,
    bool refresh,
  );
  Future<E?> findByLeftAndRightIdOnCloud({
    required String uid,
    required int leftId,
    required int rightId,
  });
  int getLeftId(E entity);
  int getRightId(E entity);
}
