part of tauari_subscription;

class SubscribePlan {
  final SubscriptionRepository subscriptionRepository;
  final CurrentSubRepository currentSubscriptionRepository;

  const SubscribePlan({
    required this.subscriptionRepository,
    required this.currentSubscriptionRepository,
  });

  Future<void> call(String? uid, Subscription subscription) async {
    if (uid == null) {
      return;
    }
    await subscriptionRepository.insert(uid, subscription);
    await currentSubscriptionRepository.update(uid, subscription);
  }
}
