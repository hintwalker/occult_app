import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/chart_cache_repository.dart';
// import '../repository/chart_firestore_repository.dart';

final updateChartProvider = Provider.autoDispose<UpdateChart>(
  (ref) => UpdateChart(
    cacheRepository: ref.read(chartCacheRepositoryProvider),
    // cloudRepository: ref.read(chartFirestoreRepositoryProvider),
  ),
);
