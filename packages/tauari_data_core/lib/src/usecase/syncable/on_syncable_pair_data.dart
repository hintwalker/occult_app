import '../../entity/syncable_entity.dart';
import '../../entity/syncable_entity_pair.dart';
import '../../query/query_args.dart';
import '../../repository/dep/syncable_dependent_repository.dart';

abstract class OnSyncablePairData<E extends SyncableEntity,
    O extends SyncableEntity, P extends SyncableEntityPair<E, O>> {
  final SyncableDependentRepository<E, O> repository;
  final P Function(E, O) onCreateItem;
  const OnSyncablePairData({
    required this.repository,
    required this.onCreateItem,
  });

  Stream<Iterable<P>> call({String? uid, QueryArgs? queryArgs}) => repository
      .onOwnerAndThis(
        uid: uid,
        queryArgs: queryArgs,
        onCreateItem: onCreateItem,
      )
      .map((event) => event.whereType());
}
