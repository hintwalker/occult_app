import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../utils/check_network_status.dart';
import '../service/current_sub_cache_service.dart';

final currentSubCacheDataSourceProvider =
    Provider.autoDispose<CurrentSubCloudDataSource>(
  (ref) => CurrentSubCacheDataSource(
      ref.watch(
        currentSubCacheServiceProvider,
      ),
      availableNetwork: ref.read(checkNetworkStatusProvider).call),
);
