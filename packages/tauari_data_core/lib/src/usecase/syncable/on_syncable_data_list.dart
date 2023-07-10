import '../../entity/syncable_entity.dart';
import '../../query/query_args.dart';
import '../../repository/syncable_repository.dart';

abstract class OnSyncableDataList<T extends SyncableEntity> {
  final SyncableRepository<T> repository;
  const OnSyncableDataList(this.repository);

  Stream<Iterable<T>> call(String? uid, [QueryArgs? queryArgs]) =>
      repository.onEveryWhere(uid, queryArgs);
}
