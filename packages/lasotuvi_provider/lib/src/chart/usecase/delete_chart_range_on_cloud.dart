import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
// import 'package:lasotuvi_provider/src/chart/repository/chart_cloud_firestore_repository.dart';

final deleteChartRangeOnCloud = Provider(
  (ref) => DeleteChartRangeOnCloud(
    cacheRepository: ref.read(
      chartCloudCacheRepositoryProvider,
    ),
    // cloudRepository: ref.read(
    //   chartCloudFirestoreRepositoryProvider,
    // ),
  ),
);
