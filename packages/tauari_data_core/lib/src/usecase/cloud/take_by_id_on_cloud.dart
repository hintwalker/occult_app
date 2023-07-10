import '../../entity/cloud_getable.dart';
import '../../repository/cloud_repository.dart';

class TakeByIdOnCloud<E extends CloudGetable, R extends CloudRepository<E>> {
  const TakeByIdOnCloud(this.repository);
  final R repository;
  Future<E?> call({required String uid, required String docId}) =>
      repository.byIdOnCloud(uid: uid, docId: docId);
}
