import '../../repository/cloud_repository.dart';

abstract class OnCountOnCloud<R extends CloudRepository> {
  const OnCountOnCloud(this.repository);
  final R repository;
  Stream<int?> call(String uid) => repository.onCloudCount(uid);
}
