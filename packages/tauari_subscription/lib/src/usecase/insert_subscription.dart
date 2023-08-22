import '../entity/subscription.dart';
import '../repository/current_subscription_repository.dart';
import '../repository/subscription_repository.dart';

///
/// Thực hiện 2 việc:
/// - Thêm một record vào danh sách subscription
/// - Cập nhật lại currentSubscription
class InsertSubscription {
  final SubscriptionRepository subscriptionRepository;
  final CurrentSubscriptionRepository currentSubscriptionRepository;

  const InsertSubscription({
    required this.subscriptionRepository,
    required this.currentSubscriptionRepository,
  });

  Future<void> call(String? uid, Subscription subscription) async {
    if (uid == null) {
      return;
    }
    await subscriptionRepository.insert(
      uid,
      subscription,
      false,
    );
    await currentSubscriptionRepository.update(
      uid,
      subscription.copyWith(id: 0),
      true,
    );
  }
}
