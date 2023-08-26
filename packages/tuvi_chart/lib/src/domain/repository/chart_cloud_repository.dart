import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_utils/tauari_utils.dart';

import '../entity/chart.dart';

abstract class ChartCloudRepository implements CloudRepository<Chart> {
  Future<void> uploadAvatar(
    String uid,
    AvatarFile avatar,
  );
  Future<void> deleteAvatar(
    String uid,
    String fileName,
  );

  Future<void> downloadAvatar(String uid, AvatarFile avatar);
}
