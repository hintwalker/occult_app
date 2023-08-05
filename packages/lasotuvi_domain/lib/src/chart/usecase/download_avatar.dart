import 'package:lasotuvi_domain/lasotuvi_domain.dart';

class DownloadAvatar {
  final ChartRepository chartRepository;
  const DownloadAvatar(this.chartRepository);
  Future<void> call(String uid, String localFilePath) =>
      chartRepository.downloadAvatar(
        uid,
        localFilePath,
      );
}
