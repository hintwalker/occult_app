import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../data_source/subscription_data_source_provider.dart';

final subscriptionRepositoryProvider =
    Provider.autoDispose<SubscriptionRepository>((ref) =>
        SubscriptionRepositoryImpl(ref.read(subscriptionDataSourceProvider)));
