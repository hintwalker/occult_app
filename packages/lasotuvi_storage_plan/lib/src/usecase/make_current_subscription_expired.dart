import 'package:lasotuvi_storage_plan/src/entity/update_subscription_action_result.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

class MakeCurrentSubscriptionExpired {
  const MakeCurrentSubscriptionExpired({
    required this.takeCurrentUser,
    required this.updateCurrentSubscription,
  });
  final TakeCurrentUser takeCurrentUser;
  final UpdateCurrentSubscription updateCurrentSubscription;

  Future<UpdateSubscriptionActionResult> call(Subscription subscription) async {
    final user = takeCurrentUser();
    if (user == null) {
      return UpdateSubscriptionActionResult.needSignIn;
    }
    final success = await updateCurrentSubscription.call(
      user.uidInFirestore,
      subscription.copyWith(
        status: SubscriptionStatus.expired,
      ),
    );
    if (success) {
      return UpdateSubscriptionActionResult.success;
    }
    return UpdateSubscriptionActionResult.unknownError;
  }
}
