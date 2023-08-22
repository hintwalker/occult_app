import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../../chart/repository/chart_cache_repository.dart';
import '../../tag/repository/tag_cache_repository.dart';
import 'chart_tag_cloud_cache_repository.dart';
import 'chart_tag_local_repostory_provider.dart';

final chartTagCacheRepositoryProvider =
    Provider.autoDispose<ChartTagRepositoryImpl>(
  (ref) => ChartTagRepositoryImpl(
      localRelRepository: ref.read(chartTagLocalRepositoryProvider),
      cloudRelRepository: ref.read(chartTagCloudCacheRepositoryProvider),
      leftRepository: ref.read(chartCacheRepositoryProvider),
      rightRepository: ref.read(tagCacheRepositoryProvider)),
);
