import '../../entity/cloud_getable.dart';
import '../../repository/cloud_repository.dart';

abstract class OnCountOnCloud<T extends CloudGetable> {
  const OnCountOnCloud(this.repository);
  final CloudRepository<T> repository;
  Stream<int?> call(String uid) => repository.onCloudCount(uid);
}
