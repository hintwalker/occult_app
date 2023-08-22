import '../entity/cloud_getable.dart';

abstract class CloudSingleDocRepository<E extends CloudGetable> {
  Future<E?> doc(String uid);
  Stream<E?> onDoc(String uid);
  Future<bool> update(
    String uid,
    E doc,
    bool refresh,
  );
  Future<bool> delete(String uid, bool refresh);
  Future<void> pullOnlineDoc(String uid, bool refresh);
}
