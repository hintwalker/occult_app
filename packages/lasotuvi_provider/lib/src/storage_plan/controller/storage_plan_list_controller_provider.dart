import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../usecase/take_storage_plan_by_id_provider.dart';
import '../usecase/cancel_plan.dart';
import '../usecase/make_current_subscription_expired.dart';
import '../usecase/take_last_canceled_subscription.dart';
import '../../storage_plan/usecase/extends_plan.dart';
import '../../storage_plan/usecase/subscribe_plan.dart';
import '../usecase/stop_auto_extend.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
// import 'package:tauari_utils/tauari_utils.dart';

// import '../../auth/usecase/take_current_user_provider.dart';
// import '../../energy_store/usecase/enough_energy.dart';
// import '../../energy_store/usecase/pay_energy_provider.dart';
// import '../../subscription/usecase/extends_subscription_provider.dart';
// import '../../subscription/usecase/insert_subscription_provider.dart';
// import '../../subscription/usecase/take_current_sub_provider.dart';
import '../usecase/take_all_storage_plans_provider.dart';

final storagePlanListControllerProvider =
    ChangeNotifierProvider.autoDispose<StoragePlanListController>(
  (ref) => StoragePlanListController(
    takeAllStoragePlans: ref.read(takeAllStoragePlansProvider),
    subscribePlan: ref.read(subscribePlanProvider),
    makeCurrentSubscriptionExpired:
        ref.read(makeCurrentSubscriptionExpiredProvider),
    takeStoragePlanById: ref.read(takeStoragePlanByIdProvider),
    // unSubscribePlan: ref.read(unsubscribePlanProvider),
    // extendsSubscription: ref.read(extendsSubscriptionProvider),
    // takeCurrentUser: ref.read(takeCurrentUserProvider),
    // hasConnection: availableNetwork,
    // pay: (uid, value) async {
    //   final newEnergy = await ref.read(payEnergyProvider).call(uid, value);
    //   return newEnergy.isLeft;
    // },
    // ableToPay: ref.read(enoughEnergyProvider).call,
    autoExtends: ref.read(stopAutoExtendProvider),
    // takeCurrentSub: ref.read(takeCurrentSubProvider),
    extendsPlan: ref.read(extendsPlanProvider),
    lastCanceledSubscription: ref.read(takeLastCanceledSubscription),
    cancelPlan: ref.read(cancelPlanProvider),
  ),
);
