import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../service/request_cache_service.dart';

final refreshRequestCloudProvider = Provider(
  (ref) => RefreshCache(
    ref.read(
      requestCacheServiceProvider,
    ),
  ),
);
