// ignore_for_file: invalid_use_of_protected_member

import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_statistic/src/presentation/notifier/statistic_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lasotuvi_statistic/src/presentation/state/statistic_state.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:mocktail/mocktail.dart';
import 'package:state_notifier_test/state_notifier_test.dart';
import '../../mock/mock_count_chart.dart';

void main() {
  late CountChart countChart;
  late CountChartOnCloud countChartOnCloud;
  late CountTag countTag;
  late CountTagOnCloud countTagOnCloud;
  late CountNote countNote;
  late CountNoteOnCloud countNoteOnCloud;
  late TakeCurrentStoragePlan takeCurrentStoragePlan;

  late StatisticStateNotifier notifier;

  setUpAll(() {
    countChart = MockCountChart();
    countChartOnCloud = MockCountChartOnCloud();
    countTag = MockCountTag();
    countTagOnCloud = MockCountTagOnCloud();
    countNote = MockCountNote();
    countNoteOnCloud = MockCountNoteOnCloud();
    takeCurrentStoragePlan = MockTakeCurrentStoragePlan();
    notifier = StatisticStateNotifier(
      countChart: countChart,
      countChartOnCloud: countChartOnCloud,
      countTag: countTag,
      countTagOnCloud: countTagOnCloud,
      countNote: countNote,
      countNoteOnCloud: countNoteOnCloud,
      takeCurrentStoragePlan: takeCurrentStoragePlan,
    );
  });

  stateNotifierTest<StatisticStateNotifier, StatisticState>(
    'should load chart count on everywhere',
    setUp: () {
      when(() => countChart.call('uid')).thenAnswer((invocation) async => 10);
    },
    actions: (notifier) async {
      await notifier.fetchData('uid');
    },
    build: () => StatisticStateNotifier(
      countChart: countChart,
      countChartOnCloud: countChartOnCloud,
      countTag: countTag,
      countTagOnCloud: countTagOnCloud,
      countNote: countNote,
      countNoteOnCloud: countNoteOnCloud,
      takeCurrentStoragePlan: takeCurrentStoragePlan,
    ),
    expect: () => [
      const StatisticState(
        state: StatisticWorkingState.loading,
      ),
      const StatisticState(
        state: StatisticWorkingState.loaded,
        hasData: true,
        totalChartCount: 10,
      )
    ],
  );
  test('should reset state', () {
    notifier.resetState();
    expect(notifier.state, const StatisticState.initial());
  });
}
