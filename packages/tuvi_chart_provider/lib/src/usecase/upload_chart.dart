import 'package:riverpod/riverpod.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import '../repository/chart_cache_repository.dart';

final uploadChartProvider = Provider.autoDispose<UploadChart>(
  (ref) => UploadChart(
    cacheRepository: ref.read(chartCacheRepositoryProvider),
    // cloudRepository: ref.read(chartFirestoreRepositoryProvider),
  ),
);
