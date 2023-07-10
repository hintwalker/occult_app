import '../dao/dao.dart';
import '../model/local_model.dart';
import '../query/query_args.dart';

abstract class LocalDataSource<T extends LocalModel> {
  final Dao dao;
  final T Function(Map<String, Object?>) fromMap;
  LocalDataSource(this.dao, {required this.fromMap});

  Future<int> insert(T item) async {
    try {
      final id = await dao.insert(item.toSqlite());
      return id;
    } catch (e) {
      return -1;
    }
  }

  Future<int> update(T item) async {
    try {
      final rows = await dao.update(item.toSqlite());
      return rows;
    } catch (e) {
      return 0;
    }
  }

  Future<int> delete(int itemId) async {
    try {
      final rows = await dao.delete(itemId);
      return rows;
    } catch (e) {
      return 0;
    }
  }

  Future<int> deleteWhere(String where, List<Object?> whereArgs) async {
    try {
      final rows = await dao.deleteWhere(where, whereArgs);
      return rows;
    } catch (e) {
      return 0;
    }
  }

  Future<T?> byId(int itemId) async {
    final map = await dao.byId(itemId);
    if (map == null) {
      return null;
    }
    return fromMap(map);
  }

  Stream<int> onCount() => dao.onCount();
  Stream<Iterable<T>> onData([QueryArgs? queryArgs]) {
    return dao.onData(queryArgs).map((event) => event.map((e) => fromMap(e)));
  }

  Future<Iterable<T>> data([QueryArgs? queryArgs]) async {
    final result = await dao.data(queryArgs);
    return result.map((e) => fromMap(e));
  }

  Future<Iterable<T>> rawQuery(String sql, [List<Object?>? arguments]) async {
    final result = await dao.rawQuery(sql, arguments);
    return result.map((e) => fromMap(e));
  }

  Stream<T?> onById(int itemId) {
    return dao.onById(itemId).map((e) => e == null ? null : fromMap(e));
  }
}
