import 'package:tauari_utils/tauari_utils.dart';

import '../repository/chart_repository.dart';

class UploadAvatar {
  const UploadAvatar(this.chartRepository);
  final ChartRepository chartRepository;
  Future<void> call(String? uid, AvatarFile avatar) async {
    if (uid == null) {
      return;
    }
    await chartRepository.uploadAvatar(uid, avatar);
  }
}
