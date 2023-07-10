import '../entity/cloud_getable.dart';

abstract class CloudSingleDocRepository<E extends CloudGetable> {
  Future<E?> doc(String uid);
  Stream<E?> onDoc(String uid);
  Future<bool> update(String uid, E doc);
  Future<bool> delete(String uid);
}
