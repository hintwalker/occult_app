import 'package:lasotuvi_storage_plan/src/usecase/calculate_day_spent.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

class CalculateEnergyPaid {
  const CalculateEnergyPaid({
    required this.calculateDaySpent,
  });
  final CalculateDaySpent calculateDaySpent;

  int call(Subscription subscription) {
    final passedDays = calculateDaySpent(subscription);
    if (TimeConfig.expiredDuration.inDays == 0) {
      return 0;
    }
    return (subscription.energy / TimeConfig.expiredDuration.inDays).floor() *
        passedDays;
  }
}
