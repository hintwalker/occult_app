import 'package:tauari_data_core/tauari_data_core.dart';

class PullSingleDoc {
  const PullSingleDoc({
    required this.cacheRepository,
    // required this.cloudRepository,
  });
  final CloudSingleDocRepository cacheRepository;
  // final CloudSingleDocRepository cloudRepository;
  Future<void> call(
    String uid, {
    required bool refresh,
  }) async {
    await cacheRepository.pullOnlineDoc(uid, refresh);
    // final data = await cloudRepository.doc(uid);
    // if (data == null) {
    //   return;
    // }
    // await cacheRepository.update(uid, data, refresh);
  }
}
