import '../../../entity/sqlite_getable.dart';
import '../../../model/local_model.dart';
import '../../../query/query_args.dart';
import '../../dep/local_dependent_repository.dart';
import '../../local_repository.dart';
import '../local_repository_impl.dart';

abstract class LocalDependentRepositoryImpl<
        E extends SqliteGetable,
        M extends LocalModel<E>,
        O extends SqliteGetable> extends LocalRepositoryImpl<E, M>
    implements LocalDependentRepository<E, O> {
  LocalDependentRepositoryImpl(super.dataSource,
      {required this.ownerIdColumn,
      required this.ownerRepository,
      required super.entityToModel});

  final String ownerIdColumn;
  final LocalRepository<O> ownerRepository;

  @override
  Future<Iterable<E>> byOwnerIdLocal(int ownerId) async {
    return await dataLocal(
        QueryArgs(where: '$ownerIdColumn = ?', whereArgs: [ownerId]));
  }

  @override
  Future<int> deleteByOwnerLocal(int ownerId) async {
    return await dataSource.deleteWhere('$ownerIdColumn = ?', [ownerId]);
  }

  @override
  Stream<Iterable<E>> onByOwnerIdLocal(int ownerId) {
    return onLocal(
        QueryArgs(where: '$ownerIdColumn = ?', whereArgs: [ownerId]));
  }

  @override
  Future<O?> ownerLocal(int dependentId) async {
    final dependentItem = await byIdOnLocal(dependentId);
    if (dependentItem == null) {
      return null;
    }
    final ownerId = getOwnerId(dependentItem);
    return await ownerRepository.byIdOnLocal(ownerId);
  }
}
