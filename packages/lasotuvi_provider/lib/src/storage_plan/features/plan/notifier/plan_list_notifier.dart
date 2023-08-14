import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/storage_plan/usecase/extends_plan.dart';
import 'package:lasotuvi_provider/src/storage_plan/usecase/subscribe_plan.dart';
import 'package:lasotuvi_provider/src/storage_plan/usecase/take_last_canceled_subscription.dart';
import 'package:lasotuvi_provider/src/utils/check_network_status.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../../../../auth/usecase/take_current_user_provider.dart';
import '../../../usecase/take_all_storage_plans_provider.dart';
import '../../../usecase/verify_current_plan_state.dart';

final planListNotifierProvider =
    StateNotifierProvider<PlanListNotifier, PlanListState>(
  (ref) => PlanListNotifier(
    takeCurrentUser: ref.read(takeCurrentUserProvider),
    takeLastCanceledSubscription:
        ref.read(takeLastCanceledSubscriptionProvider),
    checkNetworkStatus: ref.read(checkNetworkStatusProvider),
    takeAllStoragePlans: ref.read(takeAllStoragePlansProvider),
    subscribePlan: ref.read(subscribePlanProvider),
    extendsPlan: ref.read(extendsPlanProvider),
    verifyCurrentPlanState: ref.read(verifyCurrentPlanStateProvider),
    // verifyCurrentSubscription: ref.read(verifySubscriptionProvider),
    // takeStoragePlanById: ref.read(
    //   takeStoragePlanByIdProvider,
    // ),
    // takeCurrentSubscription: ref.read(takeCurrentSubProvider),
    // hasSubscriptionExpired: ref.read(hasSubscriptionExpiredProvider),
  ),
);
