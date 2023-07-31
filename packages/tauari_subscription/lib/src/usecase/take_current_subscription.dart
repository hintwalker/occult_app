import '../entity/subscription.dart';
import '../repository/current_subscription_repository.dart';

class TakeCurrentSubscription {
  final CurrentSubscriptionRepository repository;
  const TakeCurrentSubscription(this.repository);

  Future<Subscription?> call(String? uid) async {
    if (uid == null) {
      return Future.value(null);
    }
    return await repository.doc(uid);
  }
}
