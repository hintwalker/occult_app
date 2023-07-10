import '../entity/sqlite_getable.dart';
import '../query/query_args.dart';

abstract class LocalRepository<T extends SqliteGetable> {
  Stream<Iterable<T>> onLocal([QueryArgs? queryArgs]);
  Stream<int> onLocalCount();
  Stream<T?> onByIdOnLocal(int itemId);
  Future<T?> byIdOnLocal(int itemId);
  Future<int> deleteFromLocal(int itemId);
  Future<int> insertToLocal(T item);
  Future<Iterable<T>> dataLocal([QueryArgs? queryArgs]);
  Future<void> updateOnLocal(T item);
}
