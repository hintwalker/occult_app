import '../entity/subscription.dart';

import '../config/time_config.dart';

class HasSubscriptionCanceled {
  bool call(Subscription subscription) {
    return subscription.expiredDate
        .add(
          TimeConfig.cancelDuration,
        )
        .isBefore(DateTime.now());
  }
}
