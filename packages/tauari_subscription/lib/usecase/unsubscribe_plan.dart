part of tauari_subscription;

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
