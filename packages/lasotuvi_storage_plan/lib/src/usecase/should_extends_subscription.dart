import 'package:tauari_subscription/tauari_subscription.dart';

bool shouldExtendsSubscription(Subscription? subscription) {
  if (subscription == null) {
    return false;
  }
  final now = DateTime.now();

  final canceledDate = subscription.expiredDate.add(TimeConfig.cancelDuration);
  final result =
      !(now.isBefore(subscription.expiredDate) || now.isAfter(canceledDate));
  return result;
}
