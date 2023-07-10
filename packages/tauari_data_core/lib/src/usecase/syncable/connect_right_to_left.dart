import '../../entity/syncable_entity.dart';
import '../../repository/rel/syncable_rel_repository.dart';

class ConnectRightToLeft<E extends SyncableEntity, L extends SyncableEntity,
    R extends SyncableEntity> {
  const ConnectRightToLeft(this.repository);
  final SyncableRelRepository<E, L, R> repository;

  Future<void> call(
      {String? uid, required L left, required Iterable<R> rights}) async {
    await repository.connectRightToLeft(uid: uid, left: left, rights: rights);
  }
}
