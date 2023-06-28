part of tauari_data_core;

abstract class NewData<E extends SyncableEntity, R extends SyncableRepository> {
  final R repository;

  NewData(this.repository);
  Future<void> call(String? uid, E entity) async {
    await repository.localRepository.insertToLocal(entity);
    if (uid != null) {
      await repository.cloudRepository.insert(uid, entity);
    }
  }
}
