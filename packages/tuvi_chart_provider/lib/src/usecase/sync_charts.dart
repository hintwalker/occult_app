import 'package:riverpod/riverpod.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import '../repository/chart_cache_repository.dart';

final syncChartsProvider = Provider.autoDispose<SyncCharts>(
  (ref) => SyncCharts(ref.read(chartCacheRepositoryProvider)),
);
