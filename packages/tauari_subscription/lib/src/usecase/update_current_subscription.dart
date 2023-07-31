import '../entity/subscription.dart';
import '../repository/current_subscription_repository.dart';

class UpdateCurrentSubscription {
  final CurrentSubscriptionRepository repository;
  const UpdateCurrentSubscription(this.repository);

  Future<bool> call(String? uid, Subscription sub) async {
    if (uid == null) {
      return Future.value(false);
    }
    return repository.update(uid, sub);
  }
}
