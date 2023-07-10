import '../../entity/syncable_entity.dart';
import '../../repository/syncable_repository.dart';

class DeleteEveryWhere<T extends SyncableEntity, R extends SyncableRepository> {
  final R repository;
  const DeleteEveryWhere(this.repository);

  Future<void> call(String uid, T entity) async {
    await repository.deleteEveryWhere(uid, entity);
    // await repository.deleteFromCloud(uid: uid, docId: entity.keyId);
    // await repository.deleteFromLocal(entity.id);
  }
}
