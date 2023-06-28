part of tauari_data_core;

class DisConnectLeftFromRight<E extends SyncableEntity,
    L extends SyncableEntity, R extends SyncableEntity> {
  const DisConnectLeftFromRight(this.repository);
  final SyncableRelRepository<E, L, R> repository;

  Future<void> call(
      {String? uid, required int rightId, required Iterable<L> lefts}) async {
    await repository.disConnectLeftFromRight(
        uid: uid, rightId: rightId, lefts: lefts);
  }
}
