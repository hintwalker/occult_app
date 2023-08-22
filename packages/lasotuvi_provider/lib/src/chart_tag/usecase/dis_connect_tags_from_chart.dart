import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
// import 'package:lasotuvi_provider/src/chart_tag/repository/chart_tag_cloud_firestore_reposistory.dart';

import '../repository/chart_tag_cache_repository.dart';

final disConnectTagsFromChartProvider =
    Provider.autoDispose<DisConnectTagsFromChart>(
  (ref) => DisConnectTagsFromChart(
    cacheRepository: ref.read(chartTagCacheRepositoryProvider),
    // cloudRepository: ref.read(chartTagCloudFirestoreRepositoryProvider),
  ),
);
