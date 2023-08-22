import '../../entity/syncable_entity.dart';
import '../../repository/syncable_repository.dart';

class DeleteEveryWhere<T extends SyncableEntity, R extends SyncableRepository> {
  final R cacheRepository;
  final R cloudRepository;
  const DeleteEveryWhere({
    required this.cacheRepository,
    required this.cloudRepository,
  });

  Future<void> call(
    String uid,
    T entity,
    bool refresh,
  ) async {
    await cacheRepository.deleteEveryWhere(
      uid,
      entity,
      refresh,
    );
    await cloudRepository.cloudRepository.deleteFromCloud(
      uid: uid,
      docId: entity.docId,
      refresh: false,
    );
    // await repository.deleteFromCloud(uid: uid, docId: entity.keyId);
    // await repository.deleteFromLocal(entity.id);
  }
}
