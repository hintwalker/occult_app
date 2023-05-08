part of tauari_data_core;

abstract class CloudSingleDocRepository<E extends CloudStorable> {
  Future<E?> doc(String uid);
  Stream<E?> onDoc(String uid);
  Future<bool> update(String uid, E doc);
  Future<bool> delete(String uid);
}
