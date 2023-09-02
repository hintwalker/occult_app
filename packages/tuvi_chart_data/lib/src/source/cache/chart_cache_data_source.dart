import 'package:tauari_firestore_cache/tauari_firestore_cache.dart';

import '../../model/chart_model.dart';
import '../remote/chart_cloud_data_source.dart';

class ChartCacheDataSource extends ChartCloudDataSource {
  ChartCacheDataSource(
    super.firestoreService, {
    required super.remoteFileService,
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              cacheToModel(snapshot, fromMap: ChartModel.fromMap),
          listMapper: (snapshot) =>
              cacheToModelList(snapshot, fromMap: ChartModel.fromMap),
        );
}
