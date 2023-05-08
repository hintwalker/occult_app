part of tauari_data_core;

class TakeById<E extends SyncableEntity, R extends SyncableRepository<E>> {
  const TakeById(this.repository);
  final R repository;
  Future<E?> call({String? uid, required int entityId}) =>
      repository.byId(uid: uid, docId: entityId);
}
