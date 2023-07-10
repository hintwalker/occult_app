import '../../entity/syncable_entity.dart';
import '../../repository/syncable_repository.dart';

abstract class OnSyncableData<T extends SyncableEntity> {
  final SyncableRepository<T> repository;
  const OnSyncableData(this.repository);

  Stream<T?> call({
    required String? uid,
    required int docId,
    required String? syncStatus,
  }) =>
      repository.onById(
        uid: uid,
        docId: docId,
        syncStatus: syncStatus,
      );
}
