import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import '../../../entity/storage_plan.dart';
import '../../../usecase/prepare_bill.dart';
import '../../../usecase/take_current_storage_plan.dart';
import '../state/subscription_confirm_state.dart';

class SubscriptionConfirmNotifier
    extends StateNotifier<SubscriptionConfirmState> {
  SubscriptionConfirmNotifier({
    required this.takeCurrentStoragePlan,
    required this.countChartOnCloud,
    required this.countNoteOnCloud,
    required this.countTagOnCloud,
    required this.enoughEnergy,
    required this.prepareBill,
    required this.takeCurrentSubscription,
  }) : super(
          const SubscriptionConfirmState.initial(),
        );

  final TakeCurrentStoragePlan takeCurrentStoragePlan;
  final CountChartOnCloud countChartOnCloud;
  final CountTagOnCloud countTagOnCloud;
  final CountNoteOnCloud countNoteOnCloud;
  final EnoughEnergy enoughEnergy;
  final PrepareBill prepareBill;
  final TakeCurrentSubscription takeCurrentSubscription;

  Future<void> fetchData({
    required String? uid,
    required StoragePlan nextPlan,
  }) async {
    state =
        state.copyWith(workingState: SubscriptionConfirmWorkingState.loading);
    final countChart = await countChartOnCloud(uid);
    final countNote = await countNoteOnCloud(uid);
    final countTag = await countTagOnCloud(uid);
    final canAfford = await enoughEnergy.call(uid, nextPlan.energy);
    final currentPlan = await takeCurrentStoragePlan(uid);
    final currentSubsciption = await takeCurrentSubscription(uid);
    final bill = prepareBill(
      currentSubscription: currentSubsciption,
      nextPlan: nextPlan,
    );

    state = state.copyWith(
      workingState: SubscriptionConfirmWorkingState.loaded,
      currentPlan: currentPlan,
      nextPlan: nextPlan,
      countChartOnCloud: countChart,
      countNoteOnCloud: countNote,
      countTagOnCloud: countTag,
      canAfford: canAfford,
      bill: bill,
    );
  }
}
