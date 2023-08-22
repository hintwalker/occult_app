import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';

abstract class ChartCloudRepository implements CloudRepository<Chart> {
  Future<void> uploadAvatar(
    String uid,
    String localFilePath,
  );
  Future<void> deleteAvatar(
    String uid,
    String fileName,
  );

  Future<void> downloadAvatar(String uid, String localFilePath);
}
