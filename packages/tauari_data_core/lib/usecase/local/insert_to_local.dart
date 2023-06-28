part of tauari_data_core;

class InsertToLocal<E extends SqliteGetable, R extends LocalRepository> {
  final R repository;

  const InsertToLocal(this.repository);
  Future<int> call(E entity) async {
    return await repository.insertToLocal(entity);
  }
}
