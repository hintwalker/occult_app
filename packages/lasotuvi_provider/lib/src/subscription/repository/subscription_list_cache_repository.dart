import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../data_source/subscription_list_cache_data_source.dart';
import '../data_source/subscription_list_firestore_data_source.dart';

final subscriptionListCacheRepositoryProvider =
    Provider.autoDispose<SubscriptionRepository>(
  (ref) => SubscriptionRepositoryImpl(
    ref.read(subscriptionListCacheDataSourceProvider),
    onlineDataSource: ref.read(subscriptionListFirestoreDataSourceProvider),
  ),
);
