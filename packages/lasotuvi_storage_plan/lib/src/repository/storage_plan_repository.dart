import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/storage_plan.dart';

abstract class StoragePlanRepository
    implements ReadOnlyCloudRepository<StoragePlan> {
  // Future<StoragePlan?> byId(String id);
  // Future<Iterable<StoragePlan>> all();
}
