import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/utils/check_network_status.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

final chartCacheServiceProvider = Provider(
  (ref) => ChartCacheService(
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
