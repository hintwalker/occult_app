part of tauari_data_core;

abstract class JsonListRepositoryImpl<T> implements JsonListRepository<T> {
  const JsonListRepositoryImpl(this.dataSource);
  final JsonListDataSource<T> dataSource;
  @override
  Iterable<T> allData() => dataSource.data;
}
