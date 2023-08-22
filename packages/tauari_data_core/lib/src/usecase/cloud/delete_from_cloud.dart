import '../../entity/cloud_getable.dart';
import '../../repository/cloud_repository.dart';

class DeleteFromCloud<E extends CloudGetable, R extends CloudRepository> {
  final R cacheRepository;
  // final R cloudRepository;

  const DeleteFromCloud({
    required this.cacheRepository,
    // required this.cloudRepository,
  });
  Future<void> call(
    String uid,
    E entity,
    bool refresh,
  ) async {
    await cacheRepository.deleteFromCloud(
      uid: uid,
      docId: entity.docId,
      refresh: refresh,
    );
    // await cloudRepository.deleteFromCloud(
    //   uid: uid,
    //   docId: entity.docId,
    //   refresh: false,
    // );
  }
}
