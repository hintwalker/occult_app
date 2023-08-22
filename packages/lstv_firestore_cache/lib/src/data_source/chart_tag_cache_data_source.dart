import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../mapper/cache_to_model.dart';
import '../mapper/cache_to_model_list.dart';

class ChartTagCacheDataSource extends ChartTagCloudDataSource {
  ChartTagCacheDataSource(super.service, {required super.availableNetwork})
      : super(
          itemMapper: (snapshot) =>
              cacheToModel(snapshot, fromMap: ChartTagModel.fromMap),
          listMapper: (snapshot) =>
              cacheToModelList(snapshot, fromMap: ChartTagModel.fromMap),
        );
}
