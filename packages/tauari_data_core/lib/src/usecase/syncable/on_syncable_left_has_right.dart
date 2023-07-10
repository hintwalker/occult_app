import '../../entity/syncable_entity.dart';
import '../../entity/syncable_entity_carrier.dart';
import '../../repository/rel/syncable_rel_repository.dart';

abstract class OnSyncableLeftHasRight<
    E extends SyncableEntity,
    L extends SyncableEntity,
    R extends SyncableEntity,
    Q extends SyncableEntityCarrier<L, R>> {
  final SyncableRelRepository<E, L, R> repository;
  final Q Function(L, Iterable<R>) onCreateItem;
  const OnSyncableLeftHasRight(
      {required this.repository, required this.onCreateItem});

  Stream<Q?> call(String? uid, L left) => repository
      .onLeftHasRight(uid: uid, left: left, onCreateItem: onCreateItem)
      .map((event) => event == null ? null : event as Q);
}
