import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/src/features/subscription_confirm/state/subscription_confirm_state.dart';
import 'package:lasotuvi_storage_plan/src/features/subscription_confirm/style/subscription_confirm_style.dart';
import 'package:lasotuvi_storage_plan/src/features/subscription_confirm/widget/actions_banner.dart';
import 'package:lasotuvi_storage_plan/src/features/subscription_confirm/widget/next_plan_info.dart';
import 'package:lasotuvi_storage_plan/src/features/subscription_confirm/widget/plan_changes.dart';

class SubscriptionConfirmScreenContent extends StatelessWidget {
  const SubscriptionConfirmScreenContent({
    super.key,
    this.style = const SubscriptionConfirmStyle(),
    required this.state,
    required this.translate,
    required this.onSubmit,
    required this.onBuyMoreEnergy,
  });
  final SubscriptionConfirmStyle style;
  final SubscriptionConfirmState state;
  final String Function(String) translate;
  final void Function() onSubmit;
  final void Function() onBuyMoreEnergy;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlanChanges(
          countChart: state.countChartOnCloud,
          countNote: state.countNoteOnCloud,
          countTag: state.countTagOnCloud,
          currentPlan: state.currentPlan,
          nextPlan: state.nextPlan,
          translate: translate,
          style: style,
        ),
        const SizedBox(
          height: 12.0,
        ),
        NextPlanInfo(
          plan: state.nextPlan,
          translate: translate,
          priceStyle: style.planPrice,
          titleStyle: style.planTitle,
        ),
        const SizedBox(
          height: 24.0,
        ),
        ActionsBanner(
            plan: state.nextPlan,
            canAfford: state.canAfford,
            onBuyMoreEnergy: onBuyMoreEnergy,
            onCancel: () => Navigator.pop(context),
            onSubmit: onSubmit,
            translate: translate)
      ],
    );
  }
}
