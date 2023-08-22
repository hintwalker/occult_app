import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/energy_store/service/energy_cache_service.dart';
import 'package:lasotuvi_provider/src/utils/check_network_status.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

final energyCacheDataSourceProvider = Provider(
  (ref) => EnergyCacheDataSource(
    ref.read(energyCacheServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
