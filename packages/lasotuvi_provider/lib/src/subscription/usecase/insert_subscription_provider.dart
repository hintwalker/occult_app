import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../repository/current_sub_repository_provider.dart';
import '../repository/subscription_repository_provider.dart';

final insertSubscriptionProvider = Provider.autoDispose<InsertSubscription>(
    (ref) => InsertSubscription(
        subscriptionRepository: ref.read(subscriptionRepositoryProvider),
        currentSubscriptionRepository: ref.read(currentSubRepositoryProvider)));
