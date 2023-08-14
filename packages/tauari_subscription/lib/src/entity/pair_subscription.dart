import 'package:tauari_subscription/src/entity/subscription.dart';

class PairSubscription {
  const PairSubscription({
    required this.current,
    required this.using,
  });
  final Subscription? current;
  final Subscription using;
}
