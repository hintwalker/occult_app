import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../mapper/cache_to_model.dart';
import '../mapper/cache_to_model_list.dart';

class RequestCacheDataSource extends RequestCloudDataSource {
  RequestCacheDataSource(super.service, {required super.availableNetwork})
      : super(
          itemMapper: (snapshot) =>
              cacheToModel(snapshot, fromMap: RequestModel.fromMap),
          listMapper: (snapshot) =>
              cacheToModelList(snapshot, fromMap: RequestModel.fromMap),
        );
}
