part of tauari_data_core;

class TakeById<E extends SyncableEntity, R extends SyncableRepository<E>> {
  const TakeById(this.repository);
  final R repository;
  Future<E?> call({
    required String? uid,
    required int entityId,
    required String? syncStatus,
  }) =>
      repository.byId(
        uid: uid,
        docId: entityId,
        syncStatus: syncStatus,
      );
}
