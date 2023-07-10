import '../../entity/syncable_entity.dart';
import '../../repository/syncable_repository.dart';

abstract class Download<E extends SyncableEntity,
    R extends SyncableRepository> {
  final R repository;

  Download(this.repository);
  Future<void> call(String uid, E entity) async {
    await repository.download(uid, entity);
  }
}
