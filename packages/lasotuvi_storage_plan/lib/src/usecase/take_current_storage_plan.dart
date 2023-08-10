import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

class TakeCurrentStoragePlan {
  const TakeCurrentStoragePlan({
    required this.takeStoragePlanById,
    required this.takeCurrentSubscription,
  });
  final TakeStoragePlanById takeStoragePlanById;
  final TakeCurrentSubscription takeCurrentSubscription;

  Future<StoragePlan> call(String? uid) async {
    final currentSub = await takeCurrentSubscription.call(uid);
    if (currentSub == null) {
      return const StoragePlan.free();
    }
    final plan = await takeStoragePlanById.call(uid, currentSub.planId);
    return plan ?? const StoragePlan.free();
  }
}
