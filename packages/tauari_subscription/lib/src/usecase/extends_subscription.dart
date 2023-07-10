import '../entity/subscription.dart';
import '../repository/current_sub_repository.dart';

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
