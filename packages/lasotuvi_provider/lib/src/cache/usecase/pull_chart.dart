import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

final pullChartProvider = Provider(
  (ref) => PullChart(
    cacheRepository: ref.read(
      chartCloudCacheRepositoryProvider,
    ),
    // cloudRepository: ref.read(
    //   chartCloudFirestoreRepositoryProvider,
    // ),
  ),
);
