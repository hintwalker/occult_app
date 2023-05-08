part of tauari_data_core;

abstract class OnCountOnLocal<R extends LocalRepository> {
  const OnCountOnLocal(this.repository);
  final R repository;
  Stream<int?> call() => repository.onLocalCount();
}
