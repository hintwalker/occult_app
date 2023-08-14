import '../../entity/cloud_getable.dart';
import '../../model/cloud_model.dart';
import '../cloud_repository.dart';
import 'read_only_cloud_repository_impl.dart';

abstract class CloudRepositoryImpl<E extends CloudGetable,
        M extends CloudModel<E>> extends ReadOnlyCloudRepositoryImpl<E, M>
    implements CloudRepository<E> {
  CloudRepositoryImpl(super.dataSource, {required super.entityToModel});

  final List<Future<void> Function(String uid, String docId)>
      onCloudDeletionTriggers = [];
  @override
  void addOnCloudDeletionTrigger(
      Future<void> Function(String uid, String docId) trigger) {
    onCloudDeletionTriggers.add(trigger);
  }

  @override
  Future<bool> deleteFromCloud(
      {required String uid, required String docId}) async {
    final result = await dataSource.delete(uid, docId);
    if (result) {
      for (var trigger in onCloudDeletionTriggers) {
        await trigger(uid, docId);
      }
    }

    return result;
  }

  // @override
  // Future<E?> byIdOnCloud({required String uid, required String docId}) async {
  //   final model = await dataSource.byId(uid, docId);
  //   return model?.toEntity();
  // }

  @override
  Future<void> updateOnCloud(E item, String uid) async {
    await dataSource.update(uid, entityToModel(item));
  }

  @override
  Future<bool> insert(String uid, E item) async {
    return await dataSource.insert(uid, entityToModel(item));
  }
}
