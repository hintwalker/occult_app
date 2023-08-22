import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/chart_cache_repository.dart';
// import '../repository/chart_firestore_repository.dart';

final uploadChartProvider = Provider.autoDispose<UploadChart>(
  (ref) => UploadChart(
    cacheRepository: ref.read(chartCacheRepositoryProvider),
    // cloudRepository: ref.read(chartFirestoreRepositoryProvider),
  ),
);
