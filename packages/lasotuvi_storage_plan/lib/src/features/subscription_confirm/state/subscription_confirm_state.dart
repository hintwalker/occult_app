import 'package:equatable/equatable.dart';

import '../../../entity/storage_plan.dart';

enum SubscriptionConfirmWorkingState {
  initial,
  loading,
  loaded,
  failure,
}

class SubscriptionConfirmState extends Equatable {
  const SubscriptionConfirmState({
    required this.workingState,
    required this.currentPlan,
    required this.nextPlan,
    required this.countChartOnCloud,
    required this.countNoteOnCloud,
    required this.countTagOnCloud,
    required this.canAfford,
    required this.bill,
  });
  final SubscriptionConfirmWorkingState workingState;
  final StoragePlan currentPlan;
  final StoragePlan nextPlan;
  final int countChartOnCloud;
  final int countTagOnCloud;
  final int countNoteOnCloud;
  final bool canAfford;
  final int bill;

  SubscriptionConfirmState copyWith({
    SubscriptionConfirmWorkingState? workingState,
    StoragePlan? currentPlan,
    StoragePlan? nextPlan,
    int? countChartOnCloud,
    int? countTagOnCloud,
    int? countNoteOnCloud,
    bool? canAfford,
    int? bill,
  }) {
    return SubscriptionConfirmState(
      workingState: workingState ?? this.workingState,
      currentPlan: currentPlan ?? this.currentPlan,
      nextPlan: nextPlan ?? this.nextPlan,
      countChartOnCloud: countChartOnCloud ?? this.countChartOnCloud,
      countNoteOnCloud: countNoteOnCloud ?? this.countNoteOnCloud,
      countTagOnCloud: countTagOnCloud ?? this.countTagOnCloud,
      canAfford: canAfford ?? this.canAfford,
      bill: bill ?? this.bill,
    );
  }

  const SubscriptionConfirmState.initial({
    this.workingState = SubscriptionConfirmWorkingState.initial,
    this.currentPlan = const StoragePlan.free(),
    this.nextPlan = const StoragePlan.free(),
    this.countChartOnCloud = 0,
    this.countNoteOnCloud = 0,
    this.countTagOnCloud = 0,
    this.canAfford = false,
    this.bill = 0,
  });

  @override
  List<Object?> get props => [
        currentPlan,
        nextPlan,
        countChartOnCloud,
        countTagOnCloud,
        countNoteOnCloud,
        canAfford,
        bill,
      ];
}
