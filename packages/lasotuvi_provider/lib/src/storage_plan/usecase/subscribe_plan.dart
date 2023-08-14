import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/auth/usecase/take_current_user_provider.dart';
import 'package:lasotuvi_provider/src/storage_plan/usecase/pay_a_plan.dart';
import 'package:lasotuvi_provider/src/storage_plan/usecase/prepare_bill.dart';
import 'package:lasotuvi_provider/src/subscription/usecase/insert_subscription_provider.dart';
import 'package:lasotuvi_provider/src/subscription/usecase/take_current_sub_provider.dart';
import 'package:lasotuvi_provider/src/subscription/usecase/update_last_canceled_subscription.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../../energy_store/usecase/enough_energy.dart';
// import '../../energy_store/usecase/pay_energy_provider.dart';

final subscribePlanProvider = Provider(
  (ref) => SubscribePlan(
    takeCurrentUser: ref.read(takeCurrentUserProvider),
    takeCurrentSubscription: ref.read(takeCurrentSubProvider),
    insertSubscription: ref.read(insertSubscriptionProvider),
    updateLastCanceledSubscription:
        ref.read(updateLastCanceledSubscriptionProvider),
    ableToPay: ref.read(enoughEnergyProvider).call,
    pay: ref.read(payAPlanProvider),
    // pay: (uid, value) async {
    //   final newEnergy = await ref.read(payEnergyProvider).call(uid, value);
    //   return newEnergy.isLeft;
    // },
    prepareBill: ref.read(
      prepareBillProvider,
    ),
  ),
);
