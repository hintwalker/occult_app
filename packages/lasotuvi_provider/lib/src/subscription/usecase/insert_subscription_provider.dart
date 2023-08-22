import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../repository/current_sub_cache_repository.dart';
import '../repository/subscription_list_cache_repository.dart';

final insertSubscriptionProvider = Provider.autoDispose<InsertSubscription>(
    (ref) => InsertSubscription(
        subscriptionRepository:
            ref.read(subscriptionListCacheRepositoryProvider),
        currentSubscriptionRepository:
            ref.read(currentSubCacheRepositoryProvider)));
