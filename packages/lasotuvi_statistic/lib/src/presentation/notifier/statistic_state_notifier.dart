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
    required this.takeCurrentStoragePlan,
  }) : super(const StatisticState.initial());
  final CountChart countChart;
  final CountChartOnCloud countChartOnCloud;
  final CountTag countTag;
  final CountTagOnCloud countTagOnCloud;
  final CountNote countNote;
  final CountNoteOnCloud countNoteOnCloud;
  final TakeCurrentStoragePlan takeCurrentStoragePlan;

  Future<void> fetchData(String? uid) async {
    state = state.copyWith(
      state: StatisticWorkingState.loading,
    );
    final totalChart = await countChart(uid);
    final totalTag = await countTag(uid);
    final totalNote = await countNote(uid);
    final cloudChart = await countChartOnCloud(uid);
    final cloudTag = await countTagOnCloud(uid);
    final cloudNote = await countNoteOnCloud(uid);

    final currentPlan = await takeCurrentStoragePlan(uid);
    final maxChart = currentPlan.limitChart;
    final maxTag = currentPlan.limitTag;
    final maxNote = currentPlan.limitNote;

    state = state.copyWith(
      state: StatisticWorkingState.loaded,
      totalChartCount: totalChart,
      totalTagCount: totalTag,
      totalNoteCount: totalNote,
      cloudChartCount: cloudChart,
      cloudTagCount: cloudTag,
      cloudNoteCount: cloudNote,
      maxChartCount: maxChart,
      maxNoteCount: maxNote,
      maxTagCount: maxTag,
      showUpgradeButton: currentPlan.id != StoragePlanIds.max,
      hasData: true,
    );
  }

  void resetState() {
    state = const StatisticState.initial();
  }
}
