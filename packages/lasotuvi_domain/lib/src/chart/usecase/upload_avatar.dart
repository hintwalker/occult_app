import 'package:lasotuvi_domain/lasotuvi_domain.dart';

class UploadAvatar {
  const UploadAvatar(this.chartRepository);
  final ChartRepository chartRepository;
  Future<void> call(String? uid, String localFilePath) async {
    if (uid == null) {
      return;
    }
    await chartRepository.uploadAvatar(uid, localFilePath);
  }
}
