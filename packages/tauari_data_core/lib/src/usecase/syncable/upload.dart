import '../../entity/syncable_entity.dart';
import '../../repository/syncable_repository.dart';

abstract class Upload<E extends SyncableEntity, R extends SyncableRepository> {
  final R cacheRepository;
  // final R cloudRepository;

  Upload({
    required this.cacheRepository,
    // required this.cloudRepository,
  });
  Future<void> call(String uid, E entity, bool refresh) async {
    await cacheRepository.upload(
      uid,
      entity.copyWithUploadDate(
        DateTime.now(),
      ),
      refresh,
    );
    // await cloudRepository.cloudRepository.insert(
    //   uid,
    //   entity.copyWithUploadDate(
    //     DateTime.now(),
    //   ),
    //   false,
    // );
  }
}
