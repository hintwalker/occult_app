import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/chart/service/chart_cache_service.dart';
import 'package:lasotuvi_provider/src/utils/check_network_status.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

import '../../cloud_service/firebase_storage_service.dart';

final chartCacheDataSourceProvider = Provider(
  (ref) => ChartCacheDataSource(
    ref.watch(chartCacheServiceProvider),
    remoteFileService: ref.read(firebaseStorageServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
