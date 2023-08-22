import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../mapper/cache_to_model.dart';
import '../mapper/cache_to_model_list.dart';

class StoragePlanCacheDataSource extends StoragePlanCloudDataSource {
  StoragePlanCacheDataSource(
    super.service, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) => cacheToModel(snapshot,
              fromMap: StoragePlanModel.fromMap, idIsString: true),
          listMapper: (snapshot) => cacheToModelList(snapshot,
              fromMap: StoragePlanModel.fromMap, idIsString: true),
        );
}
