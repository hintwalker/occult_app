part of tauari_data_core;

class InsertToLocal<E extends SqliteStorable, R extends LocalRepository> {
  final R repository;

  const InsertToLocal(this.repository);
  Future<void> call(E entity) async {
    await repository.insertToLocal(entity);
  }
}
