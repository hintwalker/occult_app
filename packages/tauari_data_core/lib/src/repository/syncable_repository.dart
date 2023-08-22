import '../entity/syncable.dart';
import '../entity/syncable_entity.dart';
import '../query/query_args.dart';
import 'cloud_repository.dart';
import 'entity_repository.dart';
import 'local_repository.dart';

abstract class SyncableRepository<E extends SyncableEntity>
    implements EntityRepository<E> {
  const SyncableRepository({
    required this.localRepository,
    required this.cloudRepository,
  });
  final CloudRepository<E> cloudRepository;
  final LocalRepository<E> localRepository;
  Future<bool> upload(
    String uid,
    E item,
    bool refresh,
  );
  Future<int> download(String uid, E item);
  Stream<Iterable<E>> onEveryWhere(String? uid, [QueryArgs? queryArgs]);
  Stream<int> onCountEveryWhere(String? uid);
  Stream<E?> onById({
    required String? uid,
    required int docId,
    required String? syncStatus,
  });
  Future<E?> byId({
    required String? uid,
    required int docId,
    required String? syncStatus,
  });
  Iterable<T> mergeCloudToLocal<T extends Syncable>({
    required String uid,
    required Iterable<T> local,
    required Iterable<T> cloud,
  });
  Future<Iterable<E>> dataEveryWhere(String? uid, [QueryArgs? queryArgs]);
  Future<bool> sync(String? uid);
  Future<void> update(
    E item,
    String? uid,
    bool refresh,
  );
  Future<void> deleteEveryWhere(
    String? uid,
    E item,
    bool refresh,
  );
  void refreshCloud() => cloudRepository.refresh();
}
