import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/storage_plan/usecase/calculate_day_spent.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

final calculateEnergyPaidProvider = Provider(
  (ref) => CalculateEnergyPaid(
    calculateDaySpent: ref.read(
      calculateDaySpentProvider,
    ),
  ),
);
