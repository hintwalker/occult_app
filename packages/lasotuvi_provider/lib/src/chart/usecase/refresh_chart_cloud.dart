import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../service/chart_cache_service.dart';

final refreshChartCloudProvider = Provider(
  (ref) => RefreshCache(
    ref.read(
      chartCacheServiceProvider,
    ),
  ),
);
