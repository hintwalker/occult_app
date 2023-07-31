import '../entity/subscription.dart';
import '../repository/current_subscription_repository.dart';

class OnCurrentSub {
  final CurrentSubscriptionRepository repository;
  const OnCurrentSub(this.repository);

  Stream<Subscription?> call(String? uid) =>
      uid == null ? Stream.value(null) : repository.onDoc(uid);
}
