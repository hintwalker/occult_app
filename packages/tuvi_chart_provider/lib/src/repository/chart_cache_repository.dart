import 'package:riverpod/riverpod.dart';
import 'package:tuvi_chart_data/tuvi_chart_data.dart';

import 'chart_cloud_cache_repository.dart';
import 'chart_local_repository.dart';

final chartCacheRepositoryProvider = Provider(
  (ref) => ChartRepositoryImpl(
    localRepository: ref.watch(chartLocalRepositoryProvider),
    cloudRepository: ref.watch(chartCloudCacheRepositoryProvider),
  ),
);
