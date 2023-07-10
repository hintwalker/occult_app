import '../../entity/syncable_entity.dart';
import '../../entity/syncable_entity_carrier.dart';
import '../../query/query_args.dart';
import '../../repository/rel/syncable_rel_repository.dart';

abstract class OnSyncableLeftHasRightList<
    E extends SyncableEntity,
    L extends SyncableEntity,
    R extends SyncableEntity,
    Q extends SyncableEntityCarrier<L, R>> {
  final SyncableRelRepository<E, L, R> repository;
  final Q Function(L, Iterable<R>) onCreateItem;
  const OnSyncableLeftHasRightList(
      {required this.repository, required this.onCreateItem});

  Stream<Iterable<Q>> call(String? uid, [QueryArgs? queryArgs]) => repository
      .onLeftHasRightList(uid, onCreateItem)
      .map((event) => event.whereType());
}
