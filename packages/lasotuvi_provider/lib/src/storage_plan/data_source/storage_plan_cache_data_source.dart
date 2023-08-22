import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';
import '../../utils/check_network_status.dart';
import '../service/storage_plan_cache_service.dart';

final storagePlanCacheDataSourceProvider =
    Provider.autoDispose<StoragePlanCloudDataSource>(
  (ref) => StoragePlanCacheDataSource(
    ref.read(storagePlanCacheServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
