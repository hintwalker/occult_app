import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_utils/tauari_utils.dart';

class VerifyCurrentSubscription {
  const VerifyCurrentSubscription({
    required this.checkNetworkStatus,
    required this.hasSubscriptionCanceled,
    required this.hasSubscriptionExpired,
    required this.makeCurrentSubscriptionExpired,
    required this.cancelPlan,
    required this.takeCurrentSubscription,
    required this.takeCurrentUser,
  });
  final HasSubscriptionCanceled hasSubscriptionCanceled;
  final HasSubscriptionExpired hasSubscriptionExpired;
  final CheckNetworkStatus checkNetworkStatus;
  final MakeCurrentSubscriptionExpired makeCurrentSubscriptionExpired;
  final TakeCurrentSubscription takeCurrentSubscription;
  final CancelPlan cancelPlan;
  final TakeCurrentUser takeCurrentUser;

  Future<PairSubscription> call() async {
    final user = takeCurrentUser();
    final subscription = await takeCurrentSubscription(user?.uidInFirestore);
    if (subscription == null) {
      return PairSubscription(
        current: null,
        using: Subscription.free(),
      );
    }

    final online = await checkNetworkStatus();
    if (online) {
      if (!hasSubscriptionCanceled(subscription)) {
        if (hasSubscriptionExpired(subscription)) {
          await makeCurrentSubscriptionExpired(subscription);
          return PairSubscription(
            current: subscription,
            using: Subscription.free(),
          );
        }
        return PairSubscription(current: subscription, using: subscription);
      } else {
        await cancelPlan(subscription);
      }
    }

    return PairSubscription(
      current: Subscription.free(),
      using: Subscription.free(),
    );
  }
}
