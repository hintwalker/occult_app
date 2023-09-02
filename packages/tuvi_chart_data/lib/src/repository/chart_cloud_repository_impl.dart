import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_utils/tauari_utils.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';

import '../model/chart_model.dart';
import '../source/remote/chart_firestore_data_source.dart';

class ChartCloudRepositoryImpl extends CloudRepositoryImpl<Chart, ChartModel>
    implements ChartCloudRepository {
  ChartCloudRepositoryImpl(
    super.cacheDataSource, {
    required super.onlineDataSource,
  }) : super(entityToModel: (entity) => ChartModel.fromEntity(entity));

  @override
  Future<void> uploadAvatar(String uid, AvatarFile avatar) async {
    (onlineDataSource as ChartFirestoreDataSource).uploadAvatar(uid, avatar);
  }

  @override
  Future<void> deleteAvatar(String uid, String fileName) async {
    await (onlineDataSource as ChartFirestoreDataSource)
        .deleteAvatar(uid, fileName);
  }

  @override
  Future<void> downloadAvatar(String uid, AvatarFile avatar) async {
    await (onlineDataSource as ChartFirestoreDataSource)
        .downloadAvatar(uid, avatar);
  }
}
