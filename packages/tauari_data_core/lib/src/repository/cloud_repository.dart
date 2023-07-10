import 'read_only_cloud_repository.dart';

import '../entity/cloud_getable.dart';

abstract class CloudRepository<E extends CloudGetable>
    implements ReadOnlyCloudRepository<E> {
  void addOnCloudDeletionTrigger(
      Future<void> Function(String uid, String docId) trigger);
  Future<bool> deleteFromCloud({required String uid, required String docId});
  Future<void> updateOnCloud(E item, String uid);
  Future<bool> insert(String uid, E item);
}
