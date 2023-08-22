import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/storage_plan_model.dart';

class StoragePlanCloudDataSource extends CloudDataSource<StoragePlanModel> {
  StoragePlanCloudDataSource(
    super.service, {
    required super.itemMapper,
    required super.listMapper,
    required super.availableNetwork,
  });

  @override
  String dataCollectionPath(String uid) => 'sp';
}
