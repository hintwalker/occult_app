part of tauari_data_core;

abstract class OnCountOnCloud<R extends CloudRepository> {
  const OnCountOnCloud(this.repository);
  final R repository;
  Stream<int?> call(String uid) => repository.onCloudCount(uid);
}
