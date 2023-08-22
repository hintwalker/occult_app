import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

// import '../../chart_tag/repository/chart_tag_cloud_firestore_reposistory.dart';

final pullChartTagProvider = Provider(
  (ref) => PullChartTag(
    cacheRepository: ref.read(
      chartTagCloudCacheRepositoryProvider,
    ),
    // cloudRepository: ref.read(
    //   chartTagCloudFirestoreRepositoryProvider,
    // ),
  ),
);
