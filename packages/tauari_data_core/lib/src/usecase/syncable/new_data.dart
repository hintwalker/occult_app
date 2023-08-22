import '../../entity/syncable_entity.dart';
import '../../repository/syncable_repository.dart';

abstract class NewData<E extends SyncableEntity, R extends SyncableRepository> {
  final R cacheRepository;
  final R cloudRepository;

  NewData({
    required this.cacheRepository,
    required this.cloudRepository,
  });
  Future<void> call(
    String? uid,
    E entity,
    bool refresh,
  ) async {
    await cacheRepository.localRepository.insertToLocal(entity);
    if (uid != null) {
      await cacheRepository.cloudRepository.insert(
        uid,
        entity,
        refresh,
      );
      await cloudRepository.cloudRepository.insert(
        uid,
        entity,
        false,
      );
    }
  }
}
