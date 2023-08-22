import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/chart_model.dart';

class ChartRepositoryImpl extends SyncableRepositoryImpl<Chart, ChartModel>
    implements ChartRepository {
  ChartRepositoryImpl({
    required super.localRepository,
    required super.cloudRepository,
  });

  @override
  Future<void> uploadAvatar(String uid, String localFilePath) =>
      (cloudRepository as ChartCloudRepository)
          .uploadAvatar(uid, localFilePath);

  @override
  Future<void> deleteAvatarFromCloud(String uid, String fileName) =>
      (cloudRepository as ChartCloudRepository).deleteAvatar(uid, fileName);

  @override
  Future<void> downloadAvatar(String uid, String localFilePath) =>
      (cloudRepository as ChartCloudRepository)
          .downloadAvatar(uid, localFilePath);
}
