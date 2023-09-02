import 'package:riverpod/riverpod.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import '../repository/chart_cache_repository.dart';

final onChartProvider = Provider.autoDispose<OnChart>(
    (ref) => OnChart(ref.read(chartCacheRepositoryProvider)));
