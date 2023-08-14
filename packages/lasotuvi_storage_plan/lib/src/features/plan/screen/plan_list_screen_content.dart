import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../../../entity/storage_plan.dart';
import '../style/current_plan_style.dart';
import '../style/plan_list_item_style.dart';
import '../widget/current_plan_widget.dart';
import '../widget/plan_list_item_wrapper.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import '../state/plan_list_state.dart';

class PlanListScreenContent extends StatelessWidget {
  const PlanListScreenContent({
    super.key,
    required this.state,
    required this.currentPlanStyle,
    required this.translate,
    required this.showExtendsConfirm,
    required this.itemStyle,
    required this.onSubscribe,
  });
  final PlanListState state;
  final CurrentPlanStyle currentPlanStyle;
  final String Function(String) translate;
  final Future<bool> Function(Subscription) showExtendsConfirm;
  final void Function(StoragePlan plan) onSubscribe;
  final PlanListItemStyle itemStyle;

  @override
  Widget build(BuildContext context) {
    return state.workingState == PlanListWorkingState.loading
        ? const LoadingWidget()
        : Column(
            children: [
              CurrentPlanWidget(
                currentSubscription: state.currentSubscription,
                showPlanList: () {},
                plan: state.currentPlan,
                showUpgradeButton: false,
                style: currentPlanStyle,
                translate: translate,
                showExtendsButton: state.showExtendsButtonOnCurrentPlan,
                showExtendsConfirm: showExtendsConfirm,
                hasExpired: state.hasExpired,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, index) => PlanListItemWrapper(
                    isActived: state.isPlanActived(index),
                    translate: translate,
                    style: itemStyle,
                    plan: state.plans.elementAt(index),
                    showSubscribeButton: state.showSubscribeButtonOnPlan(index),
                    onSubscribeButtonTap: () => onSubscribe(
                      state.plans.elementAt(index),
                    ),
                  ),
                  itemCount: state.plans.length,
                ),
              )
            ],
          );
  }
}
