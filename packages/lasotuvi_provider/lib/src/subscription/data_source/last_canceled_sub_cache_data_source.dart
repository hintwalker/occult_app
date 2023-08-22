import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import '../../utils/check_network_status.dart';
import '../service/last_canceled_sub_cache_service.dart';

final lastCanceledSubCacheDataSourceProvider =
    Provider.autoDispose<LastCanceledSubCloudDataSource>((ref) =>
        LastCanceledSubCacheDataSource(
            ref.watch(lastCanceledSubCacheServiceProvider),
            availableNetwork: ref.read(checkNetworkStatusProvider).call));
