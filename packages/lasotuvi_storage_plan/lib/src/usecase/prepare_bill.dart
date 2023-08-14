import 'package:lasotuvi_storage_plan/src/usecase/calculate_energy_paid.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../entity/storage_plan.dart';
import '../entity/storage_plan_ids.dart';

class PrepareBill {
  const PrepareBill({
    required this.hasSubscriptionExpired,
    required this.calculateEnergyPaid,
  });
  final HasSubscriptionExpired hasSubscriptionExpired;
  final CalculateEnergyPaid calculateEnergyPaid;

  int call({
    required StoragePlan nextPlan,
    required Subscription? currentSubscription,
  }) {
    if (currentSubscription == null ||
        currentSubscription.planId == StoragePlanIds.free) {
      return nextPlan.energy;
    }
    if (hasSubscriptionExpired(currentSubscription)) {
      return nextPlan.energy;
    }
    final paid = calculateEnergyPaid(currentSubscription);
    return nextPlan.energy - paid;
  }
}
