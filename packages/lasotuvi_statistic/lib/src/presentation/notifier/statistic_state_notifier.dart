import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_statistic/src/presentation/state/statistic_state.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

class StatisticStateNotifier extends StateNotifier<StatisticState> {
  StatisticStateNotifier({
    required this.countChart,
    required this.countChartOnCloud,
    required this.countTag,
    required this.countTagOnCloud,
    required this.countNote,
    required this.countNoteOnCloud,
    // required this.takeStoragePlanById,
    // required this.verifyCurrentSubscription,
    // required this.takeCurrentSubscription,
    // required this.takeCurrentUser,
    // required this.hasSubscriptionExpired,
    required this.verifyCurrentPlanState,
  }) : super(const StatisticState.initial());
  final CountChart countChart;
  final CountChartOnCloud countChartOnCloud;
  final CountTag countTag;
  final CountTagOnCloud countTagOnCloud;
  final CountNote countNote;
  final CountNoteOnCloud countNoteOnCloud;
  // final VerifyCurrentSubscription verifyCurrentSubscription;
  // final TakeStoragePlanById takeStoragePlanById;
  // final TakeCurrentSubscription takeCurrentSubscription;
  // final TakeCurrentUser takeCurrentUser;
  // final HasSubscriptionExpired hasSubscriptionExpired;

  final VerifyCurrentPlanState verifyCurrentPlanState;

  // final TakeCurrentStoragePlan takeCurrentStoragePlan;

  Future<void> fetchData(String? uid) async {
    state = state.copyWith(
      workingState: StatisticWorkingState.loading,
    );
    // final user = takeCurrentUser();
    final totalChart = await countChart(uid);
    final totalTag = await countTag(uid);
    final totalNote = await countNote(uid);
    final cloudChart = await countChartOnCloud(uid);
    final cloudTag = await countTagOnCloud(uid);
    final cloudNote = await countNoteOnCloud(uid);
    final currentPlanState = await verifyCurrentPlanState();
    // final verifiedSubscription = await verifyCurrentSubscription();
    // final currentPlan = await takeStoragePlanById(
    //       verifiedSubscription.using.planId,
    //     ) ??
    //     const StoragePlan.free();
    // final maxChart = currentPlan.limitChart;
    // final maxTag = currentPlan.limitTag;
    // final maxNote = currentPlan.limitNote;
    // final currentSub = await takeCurrentSubscription(user?.uidInFirestore);
    // final shouldExtends = shouldExtendsSubscription(currentSub);
    // final shouldUpgrade =
    //     shouldExtends ? false : shouldUpgradePlan(currentPlan);

    state = state.copyWith(
      workingState: StatisticWorkingState.loaded,
      totalChartCount: totalChart,
      totalTagCount: totalTag,
      totalNoteCount: totalNote,
      cloudChartCount: cloudChart,
      cloudTagCount: cloudTag,
      cloudNoteCount: cloudNote,

      // maxChartCount: maxChart,
      // maxNoteCount: maxNote,
      // maxTagCount: maxTag,
      showExtendsButton: currentPlanState.ableToExtends,
      showUpgradeButton: currentPlanState.ableToUpgrade,
      currentPlan: currentPlanState.currentPlan,
      usingPlan: currentPlanState.usingPlan,
      currentSubscription: currentPlanState.currentSubscription,
      hasExpired: currentPlanState.hasExpired,

      // hasData: true,
    );
  }

  void resetState() {
    state = const StatisticState.initial();
  }
}
