part of tauari_data_core;

abstract class OnSyncableData<T extends SyncableEntity> {
  final SyncableRepository<T> repository;
  const OnSyncableData(this.repository);

  Stream<T?> call({required String? uid, required int docId}) =>
      repository.onById(uid: uid, docId: docId);
}
