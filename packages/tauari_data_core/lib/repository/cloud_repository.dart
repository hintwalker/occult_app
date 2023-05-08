part of tauari_data_core;

abstract class CloudRepository<T extends CloudStorable> {
  void addOnCloudDeletionTrigger(
      Future<void> Function(String uid, String docId) trigger);
  Stream<Iterable<T>> onCloud(String uid, [QueryArgs? queryArgs]);
  Stream<int> onCloudCount(String uid);
  Stream<T?> onByIdOnCloud({required String uid, required String docId});
  Future<T?> byIdOnCloud({required String uid, required String docId});
  Future<bool> deleteFromCloud({required String uid, required String docId});
  Future<Iterable<T>> dataCloud(String uid, [QueryArgs? queryArgs]);
  Future<void> updateOnCloud(T item, String uid);
  Future<bool> insert(String uid, T item);
}
