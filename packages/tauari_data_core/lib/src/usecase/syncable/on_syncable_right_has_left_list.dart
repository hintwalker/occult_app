import '../../entity/syncable_entity.dart';
import '../../entity/syncable_entity_carrier.dart';
import '../../query/query_args.dart';
import '../../repository/rel/syncable_rel_repository.dart';

abstract class OnSyncableRightHasLeftList<
    E extends SyncableEntity,
    L extends SyncableEntity,
    R extends SyncableEntity,
    Q extends SyncableEntityCarrier<R, L>> {
  final SyncableRelRepository<E, L, R> repository;
  final Q Function(R, Iterable<L>) onCreateItem;
  const OnSyncableRightHasLeftList(
      {required this.repository, required this.onCreateItem});

  Stream<Iterable<Q>> call(String? uid, [QueryArgs? queryArgs]) => repository
      .onRightHasLeftList(uid, onCreateItem)
      .map((event) => event.whereType());
}
