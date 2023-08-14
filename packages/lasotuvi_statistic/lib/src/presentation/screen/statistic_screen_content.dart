import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import '../widget/cloud_group.dart';
import '../widget/local_group.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../state/statistic_state.dart';

class StatisticScreenContent extends StatelessWidget {
  const StatisticScreenContent({
    super.key,
    required this.state,
    required this.translate,
    required this.colorScheme,
    required this.showPlans,
    required this.currentPlanStyle,
    required this.showExtendsConfirm,
  });
  final StatisticState state;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function() showPlans;
  final Future<bool> Function(Subscription) showExtendsConfirm;
  final CurrentPlanStyle currentPlanStyle;

  @override
  Widget build(BuildContext context) {
    return state.workingState == StatisticWorkingState.loading
        ? const LoadingWidget()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  LocalGroup(
                      state: state,
                      translate: translate,
                      colorScheme: colorScheme),
                  const SizedBox(
                    height: 18.0,
                  ),
                  CurrentPlanWidget(
                    currentSubscription: state.currentSubscription,
                    showPlanList: showPlans,
                    showExtendsConfirm: showExtendsConfirm,
                    plan: state.currentPlan,
                    showUpgradeButton: state.showUpgradeButton,
                    showExtendsButton: state.showExtendsButton,
                    style: currentPlanStyle,
                    translate: translate,
                    hasExpired: state.hasExpired,
                  ),
                  CloudGroup(
                    state: state,
                    translate: translate,
                    colorScheme: colorScheme,
                    showPlans: showPlans,
                  ),
                ],
              ),
            ),
          );
  }
}
