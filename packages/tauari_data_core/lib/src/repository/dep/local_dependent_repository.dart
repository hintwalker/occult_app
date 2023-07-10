import '../../entity/sqlite_getable.dart';
import '../local_repository.dart';

abstract class LocalDependentRepository<E extends SqliteGetable,
    O extends SqliteGetable> extends LocalRepository<E> {
  Future<O?> ownerLocal(int dependentId);
  Future<Iterable<E>> byOwnerIdLocal(int ownerId);
  Stream<Iterable<E>> onByOwnerIdLocal(int ownerId);
  Future<int> deleteByOwnerLocal(int ownerId);
  int getOwnerId(E entity);
}
