import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import 'chart_cloud_cache_repository.dart';
import 'chart_local_repository.dart';

final chartCacheRepositoryProvider = Provider(
  (ref) => ChartRepositoryImpl(
    localRepository: ref.watch(chartLocalRepositoryProvider),
    cloudRepository: ref.watch(chartCloudCacheRepositoryProvider),
  ),
);
