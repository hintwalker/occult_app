part of tauari_data_core;

class DeleteFromLocal<E extends SqliteStorable, R extends LocalRepository> {
  final R repository;

  const DeleteFromLocal(this.repository);
  Future<void> call(E entity) => repository.deleteFromLocal(entity.primaryKey);
}
