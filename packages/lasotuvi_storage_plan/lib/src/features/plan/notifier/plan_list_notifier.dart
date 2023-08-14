import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../entity/extends_plan_action_result.dart';
import '../../../entity/storage_plan.dart';
import '../../../entity/subscribe_action_result.dart';
import '../../../usecase/extends_plan.dart';
import '../../../usecase/subscribe_plan.dart';
import '../../../usecase/take_all_storage_plans.dart';
import '../../../usecase/verify_current_plan_state.dart';
import '../state/plan_list_state.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_utils/tauari_utils.dart';

class PlanListNotifier extends StateNotifier<PlanListState> {
  PlanListNotifier({
    // required this.takeCurrentStoragePlan,
    // required this.takeCurrentSubscription,
    required this.takeCurrentUser,
    required this.takeLastCanceledSubscription,
    required this.checkNetworkStatus,
    required this.takeAllStoragePlans,
    required this.subscribePlan,
    required this.extendsPlan,
    // required this.verifyCurrentSubscription,
    // required this.takeStoragePlanById,
    // required this.hasSubscriptionExpired,
    required this.verifyCurrentPlanState,
  }) : super(const PlanListState.initial());
  final TakeCurrentUser takeCurrentUser;
  // final TakeCurrentStoragePlan takeCurrentStoragePlan;
  // final TakeCurrentSubscription takeCurrentSubscription;
  final TakeLastCanceledSubscription takeLastCanceledSubscription;
  final CheckNetworkStatus checkNetworkStatus;
  final TakeAllStoragePlans takeAllStoragePlans;

  final SubscribePlan subscribePlan;
  final ExtendsPlan extendsPlan;
  // final VerifyCurrentSubscription verifyCurrentSubscription;
  // final TakeStoragePlanById takeStoragePlanById;
  // final TakeCurrentSubscription takeCurrentSubscription;
  // final HasSubscriptionExpired hasSubscriptionExpired;
  final VerifyCurrentPlanState verifyCurrentPlanState;

  Future<void> fetchData() async {
    state = state.copyWith(workingState: PlanListWorkingState.loading);
    final currentPlanState = await verifyCurrentPlanState();
    final user = takeCurrentUser();

    // final verifiedCurrentSub = await verifyCurrentSubscription();
    // final currentSub = await takeCurrentSubscription.call(user?.uidInFirestore);
    // final currentPlan =
    //     await takeStoragePlanById(verifiedCurrentSub.using.planId);
    final lastCanceledSub =
        await takeLastCanceledSubscription(user?.uidInFirestore);
    final plans = await takeAllStoragePlans(user?.uidInFirestore);

    // final shouldExtends = shouldExtendsSubscription(currentSub);
    // final shouldUpgrade =
    //     shouldExtends ? false : shouldUpgradePlan(currentPlan);
    state = state.copyWith(
      workingState: PlanListWorkingState.loaded,
      currentPlan: currentPlanState.currentPlan,
      usingPlan: currentPlanState.usingPlan,
      currentSubscription: currentPlanState.currentSubscription,
      lastCanceledSubscription: lastCanceledSub,
      plans: plans,
      showExtendsButtonOnCurrentPlan: currentPlanState.ableToExtends,
      showUpgradeButtonOnCurrentPlan: currentPlanState.ableToUpgrade,
      hasExpired: currentPlanState.hasExpired,
    );
  }

  Future<SubscribeActionResult> subscribe(StoragePlan plan) async {
    state = state.copyWith(workingState: PlanListWorkingState.loading);
    final connected = await checkNetworkStatus();
    if (!connected) {
      state = state.copyWith(workingState: PlanListWorkingState.loaded);
      return SubscribeActionResult.noConnection;
    }
    final result = await subscribePlan.call(plan);
    state = state.copyWith(workingState: PlanListWorkingState.loaded);
    return result;
  }

  Future<ExtendsPlanActionResult> extendsCurrentSubscription(
      Subscription subscription) async {
    state = state.copyWith(workingState: PlanListWorkingState.loading);
    final connected = await checkNetworkStatus();
    if (!connected) {
      state = state.copyWith(workingState: PlanListWorkingState.loaded);
      return ExtendsPlanActionResult.noConnection;
    }
    final result = await extendsPlan.call(subscription);
    state = state.copyWith(
      workingState: PlanListWorkingState.loaded,
      currentSubscription:
          subscription.extendExpiredDate(TimeConfig.expiredDuration),
    );
    return result;
  }
}
