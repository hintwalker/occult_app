import 'package:flutter/material.dart';
import '../style/subscription_confirm_style.dart';
import 'plan_detail.dart';

import '../../../entity/storage_plan.dart';

class PlanChanges extends StatelessWidget {
  const PlanChanges({
    super.key,
    required this.countChart,
    required this.countNote,
    required this.countTag,
    required this.currentPlan,
    required this.nextPlan,
    required this.translate,
    required this.style,
  });
  final String Function(String) translate;
  final int countChart;
  final int countTag;
  final int countNote;
  final StoragePlan currentPlan;
  final StoragePlan nextPlan;
  final SubscriptionConfirmStyle style;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PlanDetail(
          countChart: countChart,
          countNote: countNote,
          countTag: countTag,
          plan: currentPlan,
          translate: translate,
          icon: Icon(
            Icons.cancel_outlined,
            color: style.cancelPlanIconColor,
          ),
          overlay: true,
          style: style,
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Icon(Icons.arrow_downward),
        const SizedBox(
          height: 8.0,
        ),
        PlanDetail(
          countChart: countChart,
          countNote: countNote,
          countTag: countTag,
          plan: nextPlan,
          translate: translate,
          icon: Icon(
            Icons.check_circle,
            color: style.nextPlanIconColor,
          ),
          overlay: false,
          style: style,
        ),
      ],
    );
  }
}
