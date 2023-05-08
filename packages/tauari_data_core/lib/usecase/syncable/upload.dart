part of tauari_data_core;

abstract class Upload<E extends SyncableEntity, R extends SyncableRepository> {
  final R repository;

  Upload(this.repository);
  Future<void> call(String uid, E chart) async {
    await repository.upload(uid, chart);
  }
}
