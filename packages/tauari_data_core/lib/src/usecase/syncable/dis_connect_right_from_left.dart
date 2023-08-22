import '../../entity/syncable_entity.dart';
// import '../../repository/rel/cloud_rel_repository.dart';
import '../../repository/rel/syncable_rel_repository.dart';

class DisConnectRightFromLeft<E extends SyncableEntity,
    L extends SyncableEntity, R extends SyncableEntity> {
  const DisConnectRightFromLeft({
    required this.cacheRepository,
    // required this.cloudRepository,
  });
  final SyncableRelRepository<E, L, R> cacheRepository;
  // final CloudRelRepository<E, L, R> cloudRepository;

  Future<void> call({
    required String? uid,
    required L left,
    required Iterable<R> rights,
    required bool refresh,
  }) async {
    await cacheRepository.disConnectRightFromLeft(
      uid: uid,
      left: left,
      rights: rights,
      refresh: refresh,
    );
    // if (!(uid == null || ids.isEmpty)) {
    //   for (var id in ids) {
    //     await cloudRepository.deleteFromCloud(
    //         uid: uid, docId: id, refresh: false);
    //   }

    //   // await cloudRepository.disConnectManyRightFromLeft(
    //   //   uid: uid,
    //   //   left: left,
    //   //   rights: rights,
    //   //   refresh: false,
    //   // );
    // }
  }
}
