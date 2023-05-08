part of tauari_data_core;

abstract class LocalRepositoryImpl<T extends SqliteStorable,
    M extends LocalModel<T>> implements LocalRepository<T> {
  final LocalDataSource<M> dataSource;
  final M Function(T) entityToModel;

  const LocalRepositoryImpl(this.dataSource, {required this.entityToModel});

  @override
  Future<int> insertToLocal(T item) => dataSource.insert(entityToModel(item));

  @override
  Future<T?> byIdOnLocal(int itemId) async {
    final model = await dataSource.byId(itemId);
    return model?.toEntity<T>();
  }

  @override
  Future<int> deleteFromLocal(int itemId) => dataSource.delete(itemId);

  @override
  Stream<Iterable<T>> onLocal([QueryArgs? queryArgs]) {
    return dataSource.onData(queryArgs).asyncMap<Iterable<T>>((list) =>
        Future.wait(
            list.map<Future<T>>((e) async => e.toEntity<T>()).toList()));
  }

  @override
  Stream<int> onLocalCount() => dataSource.onCount();

  @override
  Future<Iterable<T>> dataLocal([QueryArgs? queryArgs]) async {
    final result = await dataSource.data(queryArgs);
    return result.map((e) => e.toEntity<T>());
  }

  @override
  Stream<T?> onByIdOnLocal(int itemId) {
    return dataSource.onById(itemId).map((event) => event?.toEntity<T>());
  }

  @override
  Future<void> updateOnLocal(T item) async {
    await dataSource.update(entityToModel(item));
  }
}
