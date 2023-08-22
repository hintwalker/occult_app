import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../service/last_canceled_sub_cache_service.dart';

final refreshLastCanceledSubCloudProvider = Provider(
  (ref) => RefreshCache(
    ref.read(
      lastCanceledSubCacheServiceProvider,
    ),
  ),
);
