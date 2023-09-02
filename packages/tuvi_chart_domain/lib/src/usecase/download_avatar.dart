import 'package:tauari_utils/tauari_utils.dart';

import '../repository/chart_repository.dart';

class DownloadAvatar {
  final ChartRepository chartRepository;
  const DownloadAvatar(this.chartRepository);
  Future<void> call(String uid, AvatarFile avatar) =>
      chartRepository.downloadAvatar(
        uid,
        avatar,
      );
}
