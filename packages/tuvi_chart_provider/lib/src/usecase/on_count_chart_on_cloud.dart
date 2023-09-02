import 'package:riverpod/riverpod.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';

import '../repository/chart_cloud_cache_repository.dart';

final onCountChartOnCloudProvider = Provider(
  (ref) => OnCountChartOnCloud(
    ref.read(chartCloudCacheRepositoryProvider),
  ),
);
