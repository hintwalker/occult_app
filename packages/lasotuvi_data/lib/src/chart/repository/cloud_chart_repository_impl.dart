import 'package:lasotuvi_data/src/chart/source/remote/firebase_chart_data_source.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/chart_model.dart';

class CloudChartRepositoryImpl extends CloudRepositoryImpl<Chart, ChartModel>
    implements CloudChartRepository {
  CloudChartRepositoryImpl(FirebaseChartDataSource ds)
      : super(ds, entityToModel: (entity) => ChartModel.fromEntity(entity));

  @override
  Future<void> uploadAvatar(String uid, String localFilePath) =>
      (dataSource as FirebaseChartDataSource).uploadAvatar(uid, localFilePath);

  @override
  Future<void> deleteAvatar(String uid, String fileName) =>
      (dataSource as FirebaseChartDataSource).deleteAvatar(uid, fileName);

  @override
  Future<void> downloadAvatar(String uid, String localFilePath) =>
      (dataSource as FirebaseChartDataSource)
          .downloadAvatar(uid, localFilePath);
}
