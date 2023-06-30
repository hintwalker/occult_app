part of tauari_data_core;

class DisConnectRightFromLeft<E extends SyncableEntity,
    L extends SyncableEntity, R extends SyncableEntity> {
  const DisConnectRightFromLeft(this.repository);
  final SyncableRelRepository<E, L, R> repository;

  Future<void> call(
      {String? uid, required int leftId, required Iterable<R> rights}) async {
    await repository.disConnectRightFromLeft(
        uid: uid, leftId: leftId, rights: rights);
  }
}
