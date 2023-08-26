import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_utils/tauari_utils.dart';

import '../entity/chart.dart';

abstract class ChartRepository extends SyncableRepository<Chart> {
  ChartRepository(
      {required super.localRepository, required super.cloudRepository});
  Future<void> uploadAvatar(
    String uid,
    AvatarFile avatar,
  );

  Future<void> deleteAvatarFromCloud(String uid, String filePath);
  Future<void> downloadAvatar(String uid, AvatarFile avatar);
}
