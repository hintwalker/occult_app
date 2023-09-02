import 'package:riverpod/riverpod.dart';

import 'package:tauari_utils/tauari_utils.dart';
import 'package:tuvi_chart_data/tuvi_chart_data.dart';

final chartCacheServiceProvider = Provider(
  (ref) => ChartCacheService(
    availableNetwork: availableNetwork,
  ),
);
