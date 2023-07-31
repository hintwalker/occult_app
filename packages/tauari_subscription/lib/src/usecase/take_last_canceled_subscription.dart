import '../entity/subscription.dart';
import '../repository/last_canceled_subscription_repository.dart';

class TakeLastCanceledSubscription {
  final LastCanceledSubscriptionRepository repository;
  const TakeLastCanceledSubscription(this.repository);

  Future<Subscription?> call(String? uid) async {
    if (uid == null) {
      return Future.value(null);
    }
    return await repository.doc(uid);
  }
}
