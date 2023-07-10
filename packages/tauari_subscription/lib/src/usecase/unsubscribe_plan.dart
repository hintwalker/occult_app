import '../entity/subscription.dart';
import '../repository/current_sub_repository.dart';

class UnSubscribePlan {
  final CurrentSubRepository currentSubscriptionRepository;

  const UnSubscribePlan({
    required this.currentSubscriptionRepository,
  });

  Future<void> call(String? uid) async {
    if (uid == null) {
      return;
    }
    // await subscriptionRepository.insert(uid, subscription);
    await currentSubscriptionRepository.update(uid, Subscription.free());
  }
}
