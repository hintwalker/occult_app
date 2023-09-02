import 'package:riverpod/riverpod.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import '../service/chart_cache_service.dart';

final refreshChartCloudProvider = Provider(
  (ref) => RefreshChartCloud(
    ref.read(
      chartCacheServiceProvider,
    ),
  ),
);
