part of tauari_data_core;

class TakeByIdOnCloud<E extends CloudStorable, R extends CloudRepository<E>> {
  const TakeByIdOnCloud(this.repository);
  final R repository;
  Future<E?> call({required String uid, required String docId}) =>
      repository.byIdOnCloud(uid: uid, docId: docId);
}
