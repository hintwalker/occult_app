import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/storage_plan/usecase/calculate_energy_paid.dart';
import 'package:lasotuvi_provider/src/subscription/usecase/has_subscription_expired.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

final prepareBillProvider = Provider(
  (ref) => PrepareBill(
    hasSubscriptionExpired: ref.read(
      hasSubscriptionExpiredProvider,
    ),
    calculateEnergyPaid: ref.read(
      calculateEnergyPaidProvider,
    ),
  ),
);
