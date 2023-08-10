import '../../entity/syncable_entity.dart';
import '../../repository/syncable_repository.dart';

abstract class CountEveryWhere<T extends SyncableEntity> {
  const CountEveryWhere(this.repository);
  final SyncableRepository<T> repository;
  Future<int> call(String? uid) async {
    final data = await repository.dataEveryWhere(uid);
    return data.length;
  }
}
