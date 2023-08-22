import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';
import '../../utils/check_network_status.dart';
import '../service/request_cache_service.dart';

final requestCacheDataSourceProvider =
    Provider.autoDispose<RequestCloudDataSource>(
  (ref) => RequestCacheDataSource(
    ref.read(requestCacheServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
