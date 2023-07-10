import '../../source/json_list_data_source.dart';
import '../json_list_repository.dart';

abstract class JsonListRepositoryImpl<T> implements JsonListRepository<T> {
  const JsonListRepositoryImpl(this.dataSource);
  final JsonListDataSource<T> dataSource;
  @override
  Iterable<T> allData() => dataSource.data;
}
