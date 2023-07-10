import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/subscription.dart';

abstract class CurrentSubRepository
    implements CloudSingleDocRepository<Subscription> {
  // Future<StoragePlan?> byId(String id);
  // Future<Iterable<StoragePlan>> all();
}
