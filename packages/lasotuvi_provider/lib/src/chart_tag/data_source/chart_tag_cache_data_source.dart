import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/chart_tag/service/chart_tag_cache_service.dart';
import 'package:lasotuvi_provider/src/utils/check_network_status.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

final chartTagCacheDataSourceProvider = Provider(
  (ref) => ChartTagCacheDataSource(
    ref.read(chartTagCacheServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
