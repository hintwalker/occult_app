import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../../subscription/usecase/has_subscription_expired.dart';
import 'take_storage_plan_by_id_provider.dart';
import 'verify_current_subscription.dart';

final verifyCurrentPlanStateProvider = Provider(
  (ref) => VerifyCurrentPlanState(
    verifyCurrentSubscription: ref.read(verifySubscriptionProvider),
    takeStoragePlanById: ref.read(takeStoragePlanByIdProvider),
    hasSubscriptionExpired: ref.read(
      hasSubscriptionExpiredProvider,
    ),
  ),
);
