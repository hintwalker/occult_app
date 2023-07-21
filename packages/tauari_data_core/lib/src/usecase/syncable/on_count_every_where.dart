import '../../entity/syncable_entity.dart';
import '../../repository/syncable_repository.dart';

abstract class OnCountEveryWhere<T extends SyncableEntity> {
  const OnCountEveryWhere(this.repository);
  final SyncableRepository<T> repository;
  Stream<int> call(String? uid) {
    return repository.onEveryWhere(uid).map((event) => event.length);
  }
}
