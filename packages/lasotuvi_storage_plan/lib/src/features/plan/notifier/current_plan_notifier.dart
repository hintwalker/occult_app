import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../usecase/verify_current_plan_state.dart';
import '../state/current_plan_state.dart';

class CurrentPlanNotifier extends StateNotifier<CurrentPlanState> {
  CurrentPlanNotifier({
    required this.verifyCurrentPlanState,
    // required this.takeCurrentUser,
    // required this.takeStoragePlanById,
    // required this.takeCurrentSubscription,
    // required this.verifySubscription,
    // required this.hasSubscriptionExpired,
    // required this.checkNetworkStatus,
    // required this.makeCurrentSubscriptionExpired,
    // required this.cancelPlan,
  }) : super(const CurrentPlanState.initial());
  final VerifyCurrentPlanState verifyCurrentPlanState;
  // final TakeCurrentUser takeCurrentUser;
  // final TakeStoragePlanById takeStoragePlanById;
  // final TakeCurrentSubscription takeCurrentSubscription;
  // final VerifyCurrentSubscription verifySubscription;
  // final HasSubscriptionExpired hasSubscriptionExpired;
  // final MakeCurrentSubscriptionExpired makeCurrentSubscriptionExpired;
  // final CheckNetworkStatus checkNetworkStatus;
  // final CancelPlan cancelPlan;
  Future<void> fetchData() async {
    state = state.copyWith(workingState: CurrentPlanWorkingState.loading);
    final currentState = await verifyCurrentPlanState();
    // final user = takeCurrentUser();

    // final subscriptionVerified = await verifySubscription();
    // final currentSubscription =
    //     await takeCurrentSubscription.call(user?.uidInFirestore);
    // final plan = await takeStoragePlanById.call(
    //   subscriptionVerified.using.planId,
    // );
    // final shouldExtends =
    //     shouldExtendsSubscription(subscriptionVerified.current);
    // final shouldUpgrade = shouldExtends ? false : shouldUpgradePlan(plan);
    state = currentState.copyWith(
      workingState: CurrentPlanWorkingState.loaded,
      // currentPlan: plan,
      // currentSubscription: subscriptionVerified.current,
      // ableToExtends: shouldExtends,
      // ableToUpgrade: shouldUpgrade,
      // hasExpired: hasSubscriptionExpired.call(subscriptionVerified.current)
    );
  }

  // Future<Subscription> verify(Subscription? subscription) async {
  //   if (subscription == null) {
  //     return Subscription.free();
  //   }
  //   if (subscription.expiredDate.isAfter(
  //     DateTime.now(),
  //   )) {
  //     return subscription;
  //   }
  //   final online = await checkNetworkStatus();
  //   if (online) {
  //     if (!isCanceled(subscription.expiredDate)) {
  //       await executeExpired(subscription);
  //     } else {
  //       await executeCanceled(subscription);
  //     }
  //   }
  //   return Subscription.free();
  // }

  // bool isCanceled(DateTime expiredDate) {
  //   return expiredDate
  //       .add(
  //         TimeConfig.cancelDuration,
  //       )
  //       .isBefore(DateTime.now());
  // }

  // Future<void> executeExpired(Subscription subscription) async {
  //   await makeCurrentSubscriptionExpired(subscription);
  // }

  // Future<void> executeCanceled(Subscription subscription) async {
  //   await cancelPlan(subscription);
  // }
}
