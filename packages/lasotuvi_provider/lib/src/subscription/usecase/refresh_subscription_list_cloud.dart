import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../service/subscription_list_cache_service.dart';

final refreshSubscriptionListCloudProvider = Provider(
  (ref) => RefreshCache(
    ref.read(
      subscriptionListCacheServiceProvider,
    ),
  ),
);
