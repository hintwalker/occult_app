import '../../entity/syncable_entity.dart';
import '../../repository/syncable_repository.dart';

abstract class Update<E extends SyncableEntity, R extends SyncableRepository> {
  final R repository;
  Update(this.repository);

  Future<void> call(String? uid, E entity) async {
    await repository.localRepository.updateOnLocal(entity);
    if (uid != null) {
      await repository.cloudRepository.insert(uid, entity);
    }
  }
}
