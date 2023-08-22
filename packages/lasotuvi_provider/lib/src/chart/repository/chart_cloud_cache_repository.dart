import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

import '../data_source/chart_cache_data_source.dart';

final chartCloudCacheRepositoryProvider = Provider<ChartCloudRepository>(
  (ref) => ChartCloudRepositoryImpl(
    ref.watch(
      chartCacheDataSourceProvider,
    ),
    onlineDataSource: ref.read(chartFirestoreDataSourceProvider),
  ),
);
