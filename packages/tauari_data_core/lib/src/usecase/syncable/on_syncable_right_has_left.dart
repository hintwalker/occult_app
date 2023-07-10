import '../../entity/syncable_entity.dart';
import '../../entity/syncable_entity_carrier.dart';
import '../../repository/rel/syncable_rel_repository.dart';

abstract class OnSyncableRightHasLeft<
    E extends SyncableEntity,
    L extends SyncableEntity,
    R extends SyncableEntity,
    Q extends SyncableEntityCarrier<R, L>> {
  final SyncableRelRepository<E, L, R> repository;
  final Q Function(R, Iterable<L>) onCreateItem;
  const OnSyncableRightHasLeft(
      {required this.repository, required this.onCreateItem});

  Stream<Q?> call(String? uid, R right) => repository
      .onRightHasLeft(uid: uid, right: right, onCreateItem: onCreateItem)
      .map((event) => event == null ? null : event as Q);
}
