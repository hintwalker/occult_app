import '../../entity/syncable_entity.dart';
// import '../../repository/rel/cloud_rel_repository.dart';
import '../../repository/rel/syncable_rel_repository.dart';

class ConnectLeftToRight<E extends SyncableEntity, L extends SyncableEntity,
    R extends SyncableEntity> {
  const ConnectLeftToRight({
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
    await cacheRepository.connectLeftToRight(
      uid: uid,
      right: right,
      lefts: lefts,
      refresh: refresh,
    );
    // if (uid != null) {
    //   await cloudRepository.connectManyLeftToRight(
    //     uid: uid,
    //     ids: ids,
    //     right: right,
    //     lefts: lefts,
    //     refresh: false,
    //   );
    // }
  }
}
