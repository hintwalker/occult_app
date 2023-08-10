import '../../entity/cloud_getable.dart';
import '../../repository/cloud_repository.dart';

abstract class CountOnCloud<T extends CloudGetable> {
  const CountOnCloud(this.repository);
  final CloudRepository<T> repository;
  Future<int> call(String? uid) async {
    if (uid == null) {
      return 0;
    }
    final data = await repository.dataCloud(uid);
    return data.length;
  }
}
