import '../../repository/syncable_repository.dart';

abstract class OnCountEveryWhere<R extends SyncableRepository> {
  const OnCountEveryWhere(this.repository);
  final R repository;
  Stream<int> call(String? uid) {
    return repository.onEveryWhere(uid).map((event) => event.length);
  }
}
