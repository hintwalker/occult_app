import '../entity/subscription.dart';

class HasSubscriptionExpired {
  bool call(Subscription? subscription) {
    if (subscription == null) {
      return false;
    }
    return subscription.expiredDate.isBefore(DateTime.now());
  }
}
