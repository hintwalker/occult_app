import '../../entity/syncable_entity.dart';
import '../../entity/syncable_entity_carrier.dart';
import '../../query/query_args.dart';
import '../../repository/dep/syncable_dependent_repository.dart';

abstract class OnSyncableOneManyData<E extends SyncableEntity,
    O extends SyncableEntity, Q extends SyncableEntityCarrier<O, E>> {
  final SyncableDependentRepository<E, O> repository;
  final Q Function(O, Iterable<E>) onCreateItem;
  const OnSyncableOneManyData(
      {required this.repository, required this.onCreateItem});

  Stream<Iterable<Q>> call(String? uid, [QueryArgs? queryArgs]) => repository
      .onOwnerHasThese(
          uid: uid, queryArgs: queryArgs, onCreateItem: onCreateItem)
      .map((event) => event.whereType());
}
