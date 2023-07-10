import '../../repository/local_repository.dart';

abstract class OnCountOnLocal<R extends LocalRepository> {
  const OnCountOnLocal(this.repository);
  final R repository;
  Stream<int?> call() => repository.onLocalCount();
}
