part of tauari_data_core;

abstract class SyncableRepository<E extends SyncableEntity>
    implements EntityRepository<E> {
  const SyncableRepository({
    required this.localRepository,
    required this.cloudRepository,
  });
  final CloudRepository<E> cloudRepository;
  final LocalRepository<E> localRepository;
  Future<bool> upload(String uid, E item);
  Future<int> download(String uid, E item);
  Stream<Iterable<E>> onEveryWhere(String? uid, [QueryArgs? queryArgs]);
  Stream<int> onCountEveryWhere(String? uid);
  Stream<E?> onById({String? uid, required int docId});
  Future<E?> byId({String? uid, required int docId});
  Iterable<T> mergeCloudToLocal<T extends Syncable>({
    required String uid,
    required Iterable<T> local,
    required Iterable<T> cloud,
  });
  Future<Iterable<E>> dataEveryWhere(String? uid, [QueryArgs? queryArgs]);
  Future<bool> sync(String? uid);
  Future<void> update(E item, String? uid);
  Future<void> deleteEveryWhere(String? uid, E item);
}
