part of tauari_data_core;

abstract class LocalRepository<T extends SqliteStorable> {
  Stream<Iterable<T>> onLocal([QueryArgs? queryArgs]);
  Stream<int> onLocalCount();
  Stream<T?> onByIdOnLocal(int itemId);
  Future<T?> byIdOnLocal(int itemId);
  Future<int> deleteFromLocal(int itemId);
  Future<int> insertToLocal(T item);
  Future<Iterable<T>> dataLocal([QueryArgs? queryArgs]);
  Future<void> updateOnLocal(T item);
}
