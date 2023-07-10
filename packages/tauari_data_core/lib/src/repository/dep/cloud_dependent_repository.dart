import '../../entity/cloud_getable.dart';
import '../cloud_repository.dart';

abstract class CloudDependentRepository<E extends CloudGetable,
    O extends CloudGetable> extends CloudRepository<E> {
  Future<O?> ownerCloud(String uid, int dependentId);
  Future<Iterable<E>> byOwnerIdCloud(String uid, int ownerId);
  Stream<Iterable<E>> onByOwnerIdCloud(String uid, int ownerId);
  Future<int> deleteByOwnerCloud(String uid, int ownerId);
  int getOwnerId(E entity);
}
