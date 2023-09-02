import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_utils/tauari_utils.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';

import '../model/chart_model.dart';

class ChartRepositoryImpl extends SyncableRepositoryImpl<Chart, ChartModel>
    implements ChartRepository {
  ChartRepositoryImpl({
    required super.localRepository,
    required super.cloudRepository,
  });

  @override
  Future<void> uploadAvatar(String uid, AvatarFile avatar) =>
      (cloudRepository as ChartCloudRepository).uploadAvatar(uid, avatar);

  @override
  Future<void> deleteAvatarFromCloud(String uid, String fileName) =>
      (cloudRepository as ChartCloudRepository).deleteAvatar(uid, fileName);

  @override
  Future<void> downloadAvatar(String uid, AvatarFile avatar) =>
      (cloudRepository as ChartCloudRepository).downloadAvatar(uid, avatar);
}
