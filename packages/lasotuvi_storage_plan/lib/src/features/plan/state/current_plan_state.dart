import 'package:equatable/equatable.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../../entity/storage_plan.dart';

enum CurrentPlanWorkingState {
  initial,
  loading,
  loaded,
  failure,
}

class CurrentPlanState extends Equatable {
  final bool hasExpired;

  const CurrentPlanState({
    required this.workingState,
    required this.currentPlan,
    required this.usingPlan,
    required this.currentSubscription,
    required this.ableToExtends,
    required this.ableToUpgrade,
    required this.hasExpired,
  });
  final StoragePlan currentPlan;
  final StoragePlan usingPlan;
  final Subscription? currentSubscription;
  final CurrentPlanWorkingState workingState;

  final bool ableToUpgrade;
  final bool ableToExtends;
  const CurrentPlanState.initial({
    this.currentPlan = const StoragePlan.free(),
    this.usingPlan = const StoragePlan.free(),
    this.workingState = CurrentPlanWorkingState.initial,
    this.currentSubscription,
    this.ableToExtends = false,
    this.ableToUpgrade = false,
    this.hasExpired = false,
  });

  CurrentPlanState copyWith({
    StoragePlan? currentPlan,
    StoragePlan? usingPlan,
    Subscription? currentSubscription,
    CurrentPlanWorkingState? workingState,
    bool? ableToExtends,
    bool? ableToUpgrade,
    bool? hasExpired,
  }) =>
      CurrentPlanState(
        workingState: workingState ?? this.workingState,
        currentPlan: currentPlan ?? this.currentPlan,
        usingPlan: usingPlan ?? this.usingPlan,
        currentSubscription: currentSubscription ?? this.currentSubscription,
        ableToExtends: ableToExtends ?? this.ableToExtends,
        ableToUpgrade: ableToUpgrade ?? this.ableToUpgrade,
        hasExpired: hasExpired ?? this.hasExpired,
      );
  @override
  List<Object?> get props => [
        currentPlan,
        usingPlan,
        currentSubscription,
        workingState,
        ableToExtends,
        ableToUpgrade,
        hasExpired,
      ];
}
