import 'package:flutter/material.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import '../state/current_plan_state.dart';
import '../style/current_plan_style.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../widget/current_plan_widget.dart';

class CurrentPlanScreenContent extends StatelessWidget {
  const CurrentPlanScreenContent({
    super.key,
    required this.state,
    required this.translate,
    required this.showPlanList,
    required this.style,
    required this.showExtendsConfirm,
  });
  final CurrentPlanState state;
  final String Function(String) translate;
  final void Function() showPlanList;
  final Future<bool> Function(Subscription) showExtendsConfirm;
  final CurrentPlanStyle style;

  @override
  Widget build(BuildContext context) {
    return state.workingState == CurrentPlanWorkingState.initial ||
            state.workingState == CurrentPlanWorkingState.loading
        ? const LoadingWidget()
        : state.workingState == CurrentPlanWorkingState.failure
            ? const SizedBox.shrink()
            : CurrentPlanWidget(
                currentSubscription: state.currentSubscription,
                showPlanList: showPlanList,
                showExtendsConfirm: showExtendsConfirm,
                plan: state.currentPlan,
                showUpgradeButton: state.ableToUpgrade,
                showExtendsButton: state.ableToExtends,
                style: style,
                translate: translate,
                hasExpired: state.hasExpired,
              );
  }
}
