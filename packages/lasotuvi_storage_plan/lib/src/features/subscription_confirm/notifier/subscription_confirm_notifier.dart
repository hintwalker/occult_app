import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import '../../../entity/storage_plan.dart';
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
  }) : super(
          const SubscriptionConfirmState.initial(),
        );

  final TakeCurrentStoragePlan takeCurrentStoragePlan;
  final CountChartOnCloud countChartOnCloud;
  final CountTagOnCloud countTagOnCloud;
  final CountNoteOnCloud countNoteOnCloud;
  final EnoughEnergy enoughEnergy;

  Future<void> fetchData({
    required String? uid,
    required StoragePlan nextPlan,
  }) async {
    state = state.copyWith(state: SubscriptionConfirmWorkingState.loading);
    final countChart = await countChartOnCloud(uid);
    final countNote = await countNoteOnCloud(uid);
    final countTag = await countTagOnCloud(uid);
    final canAfford = await enoughEnergy.call(uid, nextPlan.energy);
    final currentPlan = await takeCurrentStoragePlan(uid);
    state = state.copyWith(
      state: SubscriptionConfirmWorkingState.loaded,
      currentPlan: currentPlan,
      nextPlan: nextPlan,
      countChartOnCloud: countChart,
      countNoteOnCloud: countNote,
      countTagOnCloud: countTag,
      canAfford: canAfford,
    );
  }
}
