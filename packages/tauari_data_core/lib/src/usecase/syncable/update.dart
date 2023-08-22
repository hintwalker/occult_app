import '../../entity/syncable_entity.dart';
import '../../repository/syncable_repository.dart';
// import '../../utils/only_on_local.dart';

abstract class Update<E extends SyncableEntity, R extends SyncableRepository> {
  final R cacheRepository;
  // final R cloudRepository;
  const Update({
    required this.cacheRepository,
    // required this.cloudRepository,
  });

  Future<void> call(
    String? uid,
    E entity,
    bool refresh,
  ) async {
    await cacheRepository.update(
      entity,
      uid,
      refresh,
    );
    // if (uid != null) {
    //   await cloudRepository.cloudRepository.updateOnCloud(
    //     entity,
    //     uid,
    //     false,
    //   );
    // }
    // await repository.localRepository.updateOnLocal(entity);
    // if (!onlyOnLocal(uid: uid, syncStatus: entity.syncStatus)) {
    //   await repository.cloudRepository.insert(uid!, entity);
    // }
  }
}
