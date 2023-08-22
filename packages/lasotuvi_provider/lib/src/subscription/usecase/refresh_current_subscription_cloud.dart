import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../service/current_sub_cache_service.dart';

final refreshCurrentSubscriptionCloudProvider = Provider(
  (ref) => RefreshCache(
    ref.read(
      currentSubCacheServiceProvider,
    ),
  ),
);
