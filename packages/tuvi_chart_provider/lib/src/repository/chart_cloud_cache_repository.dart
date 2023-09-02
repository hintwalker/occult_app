import 'package:riverpod/riverpod.dart';
import 'package:tuvi_chart_data/tuvi_chart_data.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';

import '../data_source/chart_cache_data_source.dart';
import '../data_source/chart_firestore_data_source.dart';

final chartCloudCacheRepositoryProvider = Provider<ChartCloudRepository>(
  (ref) => ChartCloudRepositoryImpl(
    ref.watch(
      chartCacheDataSourceProvider,
    ),
    onlineDataSource: ref.read(chartFirestoreDataSourceProvider),
  ),
);
