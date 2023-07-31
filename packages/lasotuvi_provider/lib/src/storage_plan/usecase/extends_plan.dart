import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/usecase/take_current_user_provider.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../../energy_store/usecase/enough_energy.dart';
import '../../energy_store/usecase/pay_energy_provider.dart';
import '../../subscription/usecase/update_current_sub_provider.dart';

final extendsPlanProvider = Provider(
  (ref) => ExtendsPlan(
    takeCurrentUser: ref.read(takeCurrentUserProvider),
    pay: (uid, value) async {
      final newEnergy = await ref.read(payEnergyProvider).call(uid, value);
      return newEnergy.isLeft;
    },
    ableToPay: ref.read(enoughEnergyProvider).call,
    updateCurrentSubscription: ref.read(updateCurrentSubProvider),
  ),
);
