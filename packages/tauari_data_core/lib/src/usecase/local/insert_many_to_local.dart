import '../../entity/sqlite_getable.dart';
import '../../repository/local_repository.dart';

abstract class InsertManyToLocal<E extends SqliteGetable,
    R extends LocalRepository> {
  final R repository;

  const InsertManyToLocal(this.repository);
  Future<void> call(Iterable<E> entities) async {
    await repository.insertManyToLocal(entities);
  }
}
