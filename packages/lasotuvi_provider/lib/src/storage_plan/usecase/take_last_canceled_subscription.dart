import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/subscription/repository/last_canceled_sub_cache_repository.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

final takeLastCanceledSubscriptionProvider = Provider(
  (ref) => TakeLastCanceledSubscription(
    ref.read(
      lastCanceledSubCacheRepositoryProvider,
    ),
  ),
);
