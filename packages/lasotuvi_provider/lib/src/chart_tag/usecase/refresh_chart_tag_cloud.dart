import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../service/chart_tag_cache_service.dart';

final refreshChartTagCloudProvider = Provider(
  (ref) => RefreshCache(
    ref.read(
      chartTagCacheServiceProvider,
    ),
  ),
);
