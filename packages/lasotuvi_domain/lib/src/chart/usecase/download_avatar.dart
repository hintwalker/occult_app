import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_utils/tauari_utils.dart';

class DownloadAvatar {
  final ChartRepository chartRepository;
  const DownloadAvatar(this.chartRepository);
  Future<void> call(String uid, AvatarFile avatar) =>
      chartRepository.downloadAvatar(
        uid,
        avatar,
      );
}
