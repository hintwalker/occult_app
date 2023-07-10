import '../../entity/sqlite_getable.dart';
import '../../repository/local_repository.dart';

class DeleteFromLocal<E extends SqliteGetable, R extends LocalRepository> {
  final R repository;

  const DeleteFromLocal(this.repository);
  Future<void> call(E entity) => repository.deleteFromLocal(entity.primaryKey);
}
