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
  late VerifyCurrentPlanState verifyCurrentPlanState;
  // late TakeCurrentStoragePlan takeCurrentStoragePlan;
  // late VerifyCurrentSubscription verifyCurrentSubscription;
  // late TakeStoragePlanById takeStoragePlanById;
  // late TakeCurrentUser takeCurrentUser;
  // late TakeCurrentSubscription takeCurrentSubscription;
  // late HasSubscriptionExpired hasSubscriptionExpired;

  late StatisticStateNotifier notifier;

  setUpAll(() {
    countChart = MockCountChart();
    countChartOnCloud = MockCountChartOnCloud();
    countTag = MockCountTag();
    countTagOnCloud = MockCountTagOnCloud();
    countNote = MockCountNote();
    countNoteOnCloud = MockCountNoteOnCloud();
    verifyCurrentPlanState = MockVerifyCurrentPlanState();
    // takeCurrentUser = MockTakeCurrentUser();
    // takeCurrentSubscription = MockTakeCurrentSubscription();
    // // takeCurrentStoragePlan = MockTakeCurrentStoragePlan();
    // verifyCurrentSubscription = MockVerifyCurrentSubscription();
    // takeStoragePlanById = MockTakeStoragePlanById();
    // hasSubscriptionExpired = MockHasSubscriptionExpired();
    notifier = StatisticStateNotifier(
      countChart: countChart,
      countChartOnCloud: countChartOnCloud,
      countTag: countTag,
      countTagOnCloud: countTagOnCloud,
      countNote: countNote,
      countNoteOnCloud: countNoteOnCloud,
      verifyCurrentPlanState: verifyCurrentPlanState,
      // verifyCurrentSubscription: verifyCurrentSubscription,
      // takeStoragePlanById: takeStoragePlanById,
      // takeCurrentSubscription: takeCurrentSubscription,
      // takeCurrentUser: takeCurrentUser,
      // hasSubscriptionExpired: hasSubscriptionExpired,
      // takeCurrentStoragePlan: takeCurrentStoragePlan,
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
      verifyCurrentPlanState: verifyCurrentPlanState,
      // verifyCurrentSubscription: verifyCurrentSubscription,
      // takeStoragePlanById: takeStoragePlanById,
      // takeCurrentSubscription: takeCurrentSubscription,
      // takeCurrentUser: takeCurrentUser,
      // hasSubscriptionExpired: hasSubscriptionExpired,
    ),
    expect: () => [
      const StatisticState(
        workingState: StatisticWorkingState.loading,
      ),
      const StatisticState(
        workingState: StatisticWorkingState.loaded,
        totalChartCount: 10,
      )
    ],
  );
  test('should reset state', () {
    notifier.resetState();
    expect(notifier.state, const StatisticState.initial());
  });
}
