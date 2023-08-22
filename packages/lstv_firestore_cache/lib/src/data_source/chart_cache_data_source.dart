import 'package:lasotuvi_data/lasotuvi_data.dart';
import '../mapper/cache_to_model.dart';
import '../mapper/cache_to_model_list.dart';

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
