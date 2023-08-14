import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../../../usecase/verify_current_plan_state.dart';

final currentPlanNotifierProvider =
    StateNotifierProvider<CurrentPlanNotifier, CurrentPlanState>(
  (ref) => CurrentPlanNotifier(
    verifyCurrentPlanState: ref.read(
      verifyCurrentPlanStateProvider,
    ),
    // takeCurrentUser: ref.read(takeCurrentUserProvider),
    // takeStoragePlanById: ref.read(takeStoragePlanByIdProvider),
    // takeCurrentSubscription: ref.read(takeCurrentSubProvider),
    // verifySubscription: ref.read(verifySubscriptionProvider),
    // hasSubscriptionExpired: ref.read(hasSubscriptionExpiredProvider),
    // checkNetworkStatus: ref.read(checkNetworkStatusProvider),
    // makeCurrentSubscriptionExpired:
    //     ref.read(makeCurrentSubscriptionExpiredProvider),
    // cancelPlan: ref.read(cancelPlanProvider),
  ),
);
