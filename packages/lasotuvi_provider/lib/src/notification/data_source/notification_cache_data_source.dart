import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

import '../../utils/check_network_status.dart';
import '../service/notification_cache_service.dart';

final notificationCacheDataSourceProvider =
    Provider.autoDispose<NotificationCloudDataSource>(
  (ref) => NotificationCacheDataSource(
    ref.read(notificationCacheServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
