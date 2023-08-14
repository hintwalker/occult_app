import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

class VerifyCurrentPlanState {
  const VerifyCurrentPlanState({
    required this.verifyCurrentSubscription,
    required this.takeStoragePlanById,
    required this.hasSubscriptionExpired,
  });

  final VerifyCurrentSubscription verifyCurrentSubscription;
  // final TakeCurrentSubscription takeCurrentSubscription;
  // final TakeCurrentUser takeCurrentUser;
  final TakeStoragePlanById takeStoragePlanById;
  final HasSubscriptionExpired hasSubscriptionExpired;
  Future<CurrentPlanState> call() async {
    // final user = takeCurrentUser();
    // final currentSubscription =
    //     await takeCurrentSubscription(user?.uidInFirestore);
    final verifiedCurrentSub = await verifyCurrentSubscription();

    final currentPlan = verifiedCurrentSub.current == null
        ? const StoragePlan.free()
        : await takeStoragePlanById(
            verifiedCurrentSub.current!.planId,
          );
    final usingPlan =
        await takeStoragePlanById(verifiedCurrentSub.using.planId);
    final ableToExtends = shouldExtendsSubscription(verifiedCurrentSub.current);
    final ableToUpgrade =
        ableToExtends ? false : shouldUpgradePlan(currentPlan);

    return const CurrentPlanState.initial().copyWith(
      currentPlan: currentPlan,
      usingPlan: usingPlan,
      currentSubscription: verifiedCurrentSub.current,
      hasExpired: hasSubscriptionExpired(verifiedCurrentSub.current),
      ableToExtends: ableToExtends,
      ableToUpgrade: ableToUpgrade,
    );
  }
}
