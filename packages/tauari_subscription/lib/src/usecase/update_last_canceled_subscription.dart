import '../entity/subscription.dart';
import '../repository/last_canceled_subscription_repository.dart';

class UpdateLastCanceledSubscription {
  final LastCanceledSubscriptionRepository repository;
  const UpdateLastCanceledSubscription(this.repository);

  Future<bool> call(String? uid, Subscription sub) async {
    if (uid == null) {
      return Future.value(false);
    }
    return repository.update(uid, sub);
  }
}
