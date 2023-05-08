part of tauari_data_core;

abstract class Dao {
  Future<Iterable<Map<String, Object?>>> rawQuery(String sql,
      [List<Object?>? arguments]);

  Future<Iterable<Map<String, Object?>>> data([QueryArgs? queryArgs]);

  Future<Map<String, Object?>?> byId(int id);

  // Future<Iterable<Map<String, Object?>>> data([QueryArgs? queryArgs]);

  Stream<Iterable<Map<String, Object?>>> onData([QueryArgs? queryArgs]);

  Stream<Iterable<Map<String, Object?>>> onDataFromFuture(
      Future<Iterable<Map<String, Object?>>> Function() data);

  Future<int> insert(Map<String, Object?> item);

  // Future<int> doInsert(DatabaseExecutor db, Map<String, Object?> item);
  Future<int> delete(int itemId);

  Future<int> deleteWhere(String where, List<Object?> whereArgs);

  // Future doDelete(DatabaseExecutor db, int itemId);
  Future<int> update(Map<String, Object?> item);

  // Future doUpdate(DatabaseExecutor db, Map<String, Object?> item);
  Stream<int> onCount();

  Future<int> count();

  Stream<Map<String, Object?>?> onById(int itemId);
  Stream<Map<String, Object?>?> onItemFromFuture(
      Future<Map<String, Object?>?> Function() data);
}
