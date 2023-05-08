part of tauari_data_core;

class OnById<E extends SyncableEntity, R extends SyncableRepository<E>> {
  const OnById(this.repository);
  final R repository;
  Stream<E?> call({String? uid, required int entityId}) =>
      repository.onById(uid: uid, docId: entityId);
}
