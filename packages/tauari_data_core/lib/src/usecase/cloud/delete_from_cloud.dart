import '../../entity/cloud_getable.dart';
import '../../repository/cloud_repository.dart';

class DeleteFromCloud<E extends CloudGetable, R extends CloudRepository> {
  final R repository;

  const DeleteFromCloud(this.repository);
  Future<void> call(String uid, E entity) =>
      repository.deleteFromCloud(uid: uid, docId: entity.docId);
}
