part of tauari_data_core;

abstract class CloudRepository<E extends CloudGetable>
    implements ReadOnlyCloudRepository<E> {
  void addOnCloudDeletionTrigger(
      Future<void> Function(String uid, String docId) trigger);
  Future<bool> deleteFromCloud({required String uid, required String docId});
  Future<void> updateOnCloud(E item, String uid);
  Future<bool> insert(String uid, E item);
}
