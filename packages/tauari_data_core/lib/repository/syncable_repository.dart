part of tauari_data_core;

abstract class SyncableRepository<T extends SyncableEntity>
    implements EntityRepository<T> {
  const SyncableRepository({
    required this.localRepository,
    required this.cloudRepository,
  });
  final CloudRepository<T> cloudRepository;
  final LocalRepository<T> localRepository;
  Future<bool> upload(String uid, T item);
  Future<int> download(String uid, T item);
  Stream<Iterable<T>> onEveryWhere(String? uid, [QueryArgs? queryArgs]);
  Stream<int> onCountEveryWhere(String? uid);
  Stream<T?> onById({String? uid, required int docId});
  Future<T?> byId({String? uid, required int docId});
  Iterable<E> mergeCloudToLocal<E extends Syncable>({
    required String uid,
    required Iterable<E> local,
    required Iterable<E> cloud,
  });
  Future<Iterable<T>> dataEveryWhere(String? uid, [QueryArgs? queryArgs]);
  Future<bool> sync(String? uid);
  Future<void> update(T item, String? uid);
  Future<void> deleteEveryWhere(String? uid, T item);
}
