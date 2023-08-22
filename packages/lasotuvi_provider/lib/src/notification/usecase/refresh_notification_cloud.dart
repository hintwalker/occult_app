import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../service/notification_cache_service.dart';

final refreshNotificationCloudProvider = Provider(
  (ref) => RefreshCache(
    ref.read(
      notificationCacheServiceProvider,
    ),
  ),
);
