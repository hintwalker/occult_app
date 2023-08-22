import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../service/storage_plan_cache_service.dart';

final refreshStoragePlanCloudProvider = Provider(
  (ref) => RefreshCache(
    ref.read(
      storagePlanCacheServiceProvider,
    ),
  ),
);
