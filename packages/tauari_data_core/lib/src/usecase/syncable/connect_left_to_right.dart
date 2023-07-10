import '../../entity/syncable_entity.dart';
import '../../repository/rel/syncable_rel_repository.dart';

class ConnectLeftToRight<E extends SyncableEntity, L extends SyncableEntity,
    R extends SyncableEntity> {
  const ConnectLeftToRight(this.repository);
  final SyncableRelRepository<E, L, R> repository;

  Future<void> call(
      {String? uid, required R right, required Iterable<L> lefts}) async {
    await repository.connectLeftToRight(uid: uid, right: right, lefts: lefts);
  }
}
