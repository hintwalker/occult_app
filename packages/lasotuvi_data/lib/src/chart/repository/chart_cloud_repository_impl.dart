import 'package:lasotuvi_data/src/chart/source/remote/chart_firestore_data_source.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_utils/tauari_utils.dart';

import '../model/chart_model.dart';

class ChartCloudRepositoryImpl extends CloudRepositoryImpl<Chart, ChartModel>
    implements ChartCloudRepository {
  ChartCloudRepositoryImpl(
    super.cacheDataSource, {
    required super.onlineDataSource,
  }) : super(entityToModel: (entity) => ChartModel.fromEntity(entity));

  @override
  Future<void> uploadAvatar(String uid, AvatarFile avatar) async {
    (onlineDataSource as ChartFirestoreDataSource).uploadAvatar(uid, avatar);
    // if (cacheDataSource is ChartFirestoreDataSource) {
    //   (cacheDataSource as ChartFirestoreDataSource)
    //       .uploadAvatar(uid, localFilePath);
    // }
  }

  @override
  Future<void> deleteAvatar(String uid, String fileName) async {
    await (onlineDataSource as ChartFirestoreDataSource)
        .deleteAvatar(uid, fileName);
    // if (cacheDataSource is ChartFirestoreDataSource) {
    //   await (cacheDataSource as ChartFirestoreDataSource)
    //       .deleteAvatar(uid, fileName);
    // }
  }

  @override
  Future<void> downloadAvatar(String uid, AvatarFile avatar) async {
    await (onlineDataSource as ChartFirestoreDataSource)
        .downloadAvatar(uid, avatar);
    // if (cacheDataSource is ChartFirestoreDataSource) {
    //   await (cacheDataSource as ChartFirestoreDataSource)
    //       .downloadAvatar(uid, localFilePath);
    // }
  }
}
