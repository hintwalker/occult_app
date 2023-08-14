import 'package:tauari_subscription/tauari_subscription.dart';

class CalculateDaySpent {
  int call(Subscription subscription) {
    return DateTime.now()
        .difference(
            subscription.expiredDate.subtract(TimeConfig.expiredDuration))
        .inDays;
  }
}
