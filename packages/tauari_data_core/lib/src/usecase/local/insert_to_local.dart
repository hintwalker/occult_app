import '../../entity/sqlite_getable.dart';
import '../../repository/local_repository.dart';

abstract class InsertToLocal<E extends SqliteGetable,
    R extends LocalRepository> {
  final R repository;

  const InsertToLocal(this.repository);
  Future<int> call(E entity) async {
    return await repository.insertToLocal(entity);
  }
}
