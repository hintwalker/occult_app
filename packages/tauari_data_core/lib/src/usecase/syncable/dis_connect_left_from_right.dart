import '../../entity/syncable_entity.dart';
// import '../../repository/rel/cloud_rel_repository.dart';
import '../../repository/rel/syncable_rel_repository.dart';

class DisConnectLeftFromRight<E extends SyncableEntity,
    L extends SyncableEntity, R extends SyncableEntity> {
  const DisConnectLeftFromRight({
    required this.cacheRepository,
    // required this.cloudRepository,
  });
  final SyncableRelRepository<E, L, R> cacheRepository;
  // final CloudRelRepository<E, L, R> cloudRepository;

  Future<void> call({
    required String? uid,
    required R right,
    required Iterable<L> lefts,
    required bool refresh,
  }) async {
    await cacheRepository.disConnectLeftFromRight(
      uid: uid,
      right: right,
      lefts: lefts,
      refresh: refresh,
    );
    // if (!(uid == null || ids.isEmpty)) {
    //   for (var id in ids) {
    //     await cloudRepository.deleteFromCloud(
    //       uid: uid,
    //       docId: id,
    //       refresh: false,
    //     );
    //   }

    //   // await cloudRepository.disConnectManyLeftFromRight(
    //   //   uid: uid,
    //   //   right: right,
    //   //   lefts: lefts,
    //   //   refresh: false,
    //   // );
    // }
  }
}
