import 'package:riverpod/riverpod.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import '../repository/chart_cloud_cache_repository.dart';
// import '../repository/chart_cloud_firestore_repository.dart';

final deleteChartFromCloudProvider = Provider.autoDispose<DeleteChartFromCloud>(
  (ref) => DeleteChartFromCloud(
    cacheRepository: ref.read(chartCloudCacheRepositoryProvider),
    // cloudRepository: ref.read(chartCloudFirestoreRepositoryProvider),
  ),
);
