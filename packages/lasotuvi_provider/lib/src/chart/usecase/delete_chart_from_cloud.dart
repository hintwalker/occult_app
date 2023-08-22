import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/chart_cloud_cache_repository.dart';
// import '../repository/chart_cloud_firestore_repository.dart';

final deleteChartFromCloudProvider = Provider.autoDispose<DeleteChartFromCloud>(
  (ref) => DeleteChartFromCloud(
    cacheRepository: ref.read(chartCloudCacheRepositoryProvider),
    // cloudRepository: ref.read(chartCloudFirestoreRepositoryProvider),
  ),
);
