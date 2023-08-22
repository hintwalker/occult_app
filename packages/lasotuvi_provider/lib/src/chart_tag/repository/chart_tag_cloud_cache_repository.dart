import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/chart_cloud_cache_repository.dart';
import '../../tag/repository/tag_cloud_cache_repository.dart';
import '../data_source/chart_tag_cache_data_source.dart';
import '../data_source/chart_tag_firestore_data_source.dart';

final chartTagCloudCacheRepositoryProvider =
    Provider.autoDispose<CloudChartTagRepositoryImpl>(
  (ref) => CloudChartTagRepositoryImpl(
    ref.read(chartTagCacheDataSourceProvider),
    onlineDataSource: ref.read(chartTagFirestoreDataSourceProvider),
    leftIdColumn: ColumnChartTag.chartId,
    rightIdColumn: ColumnChartTag.tagId,
    leftRepository: ref.read(chartCloudCacheRepositoryProvider),
    rightRepository: ref.read(tagCloudCacheRepositoryProvider),
  ),
);
