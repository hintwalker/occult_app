import 'package:tauari_data_core/tauari_data_core.dart';

class PullCollection {
  const PullCollection({
    required this.cacheRepository,
    // required this.cloudRepository,
  });
  final CloudRepository cacheRepository;
  // final CloudService cloudService;
  // final CloudRepository cloudRepository;
  Future<void> call(
    String uid, {
    required bool refresh,
  }) async {
    await cacheRepository.pullOnlineData(uid, refresh);
  }
}
