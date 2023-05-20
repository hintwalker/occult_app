part of tauari_subscription;

class ExtendsSubscription {
  final CurrentSubRepository currentSubscriptionRepository;

  const ExtendsSubscription({
    required this.currentSubscriptionRepository,
  });

  Future<void> call(String? uid, Subscription subscription) async {
    if (uid == null) {
      return;
    }
    await currentSubscriptionRepository.update(
        uid, subscription.extendExpiredDate(const Duration(days: 30)));
  }
}
