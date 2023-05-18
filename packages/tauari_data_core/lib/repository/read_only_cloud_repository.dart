part of tauari_data_core;

abstract class ReadOnlyCloudRepository<E extends CloudGetable> {
  Stream<Iterable<E>> onCloud(String uid, [QueryArgs? queryArgs]);
  Stream<int> onCloudCount(String uid);
  Stream<E?> onByIdOnCloud({required String uid, required String docId});
  Future<E?> byIdOnCloud({required String uid, required String docId});
  Future<Iterable<E>> dataCloud(String uid, [QueryArgs? queryArgs]);
}
