import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import '../../utils/check_network_status.dart';
import '../service/subscription_list_cache_service.dart';

final subscriptionListCacheDataSourceProvider =
    Provider.autoDispose<SubscriptionListCloudDataSource>(
        (ref) => SubscriptionListCacheDataSource(
              ref.watch(subscriptionListCacheServiceProvider),
              availableNetwork: ref.read(checkNetworkStatusProvider).call,
            ));
