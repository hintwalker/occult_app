import '../../entity/syncable_entity.dart';
import '../../repository/dep/syncable_dependent_repository.dart';

class OwnerByDependentId<E extends SyncableEntity, O extends SyncableEntity> {
  const OwnerByDependentId(this.repository);
  final SyncableDependentRepository<E, O> repository;
  Future<O?> call({
    required String? uid,
    required int dependentId,
  }) =>
      repository.ownerOf(
        uid: uid,
        dependentId: dependentId,
      );
}
