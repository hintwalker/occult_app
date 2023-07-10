import '../../entity/syncable_entity.dart';
import '../../repository/syncable_repository.dart';

class SyncData<E extends SyncableEntity, R extends SyncableRepository> {
  const SyncData(this.repository);
  final R repository;
  Future<void> call(String? uid) => repository.sync(uid);
}
