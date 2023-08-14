import 'package:equatable/equatable.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

enum PlanListWorkingState {
  initial,
  loading,
  loaded,
  failure,
}

class PlanListState extends Equatable {
  final bool hasExpired;

  const PlanListState({
    required this.workingState,
    required this.currentPlan,
    required this.usingPlan,
    required this.currentSubscription,
    required this.lastCanceledSubscription,
    required this.plans,
    required this.showExtendsButtonOnCurrentPlan,
    required this.showUpgradeButtonOnCurrentPlan,
    required this.hasExpired,
  });
  final bool showUpgradeButtonOnCurrentPlan;
  final bool showExtendsButtonOnCurrentPlan;
  final PlanListWorkingState workingState;
  final StoragePlan currentPlan;
  final StoragePlan usingPlan;
  final Subscription? currentSubscription;
  final Subscription? lastCanceledSubscription;
  final Iterable<StoragePlan> plans;

  const PlanListState.initial({
    this.workingState = PlanListWorkingState.initial,
    this.currentPlan = const StoragePlan.free(),
    this.usingPlan = const StoragePlan.free(),
    this.currentSubscription,
    this.lastCanceledSubscription,
    this.plans = const [],
    this.showExtendsButtonOnCurrentPlan = false,
    this.showUpgradeButtonOnCurrentPlan = true,
    this.hasExpired = false,
  });

  PlanListState copyWith({
    PlanListWorkingState? workingState,
    StoragePlan? currentPlan,
    StoragePlan? usingPlan,
    Subscription? currentSubscription,
    Subscription? lastCanceledSubscription,
    Iterable<StoragePlan>? plans,
    bool? showExtendsButtonOnCurrentPlan,
    bool? showUpgradeButtonOnCurrentPlan,
    bool? hasExpired,
  }) =>
      PlanListState(
        workingState: workingState ?? this.workingState,
        currentPlan: currentPlan ?? this.currentPlan,
        usingPlan: usingPlan ?? this.usingPlan,
        currentSubscription: currentSubscription ?? this.currentSubscription,
        lastCanceledSubscription:
            lastCanceledSubscription ?? this.lastCanceledSubscription,
        plans: plans ?? this.plans,
        showExtendsButtonOnCurrentPlan: showExtendsButtonOnCurrentPlan ??
            this.showExtendsButtonOnCurrentPlan,
        showUpgradeButtonOnCurrentPlan: showUpgradeButtonOnCurrentPlan ??
            this.showUpgradeButtonOnCurrentPlan,
        hasExpired: hasExpired ?? this.hasExpired,
      );

  bool isPlanActived(int index) {
    if (plans.isEmpty) {
      return false;
    }
    return plans.elementAt(index).id == usingPlan.id;
  }

  @override
  List<Object?> get props => [
        workingState,
        currentPlan,
        usingPlan,
        currentSubscription,
        lastCanceledSubscription,
        plans,
        showExtendsButtonOnCurrentPlan,
        showUpgradeButtonOnCurrentPlan,
        hasExpired,
      ];

  bool showSubscribeButtonOnPlan(int index) {
    if (plans.isEmpty) {
      return false;
    }
    final id = plans.elementAt(index).id;
    return !(id == StoragePlanIds.free || id == usingPlan.id);
  }
}
