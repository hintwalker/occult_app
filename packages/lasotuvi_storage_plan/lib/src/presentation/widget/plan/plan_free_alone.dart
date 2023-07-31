import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'non_actived_plan_widget.dart';
import 'plan_item_widget.dart';

class PlanFreeAlone extends StatelessWidget {
  const PlanFreeAlone({
    super.key,
    required this.translate,
    // required this.colorScheme,
    required this.energyIcon,
    required this.plan,
    required this.style,
  });
  final String Function(String) translate;
  // final ColorScheme colorScheme;
  final StoragePlan plan;
  final StoragePlanStyle style;
  final Widget energyIcon;

  @override
  Widget build(BuildContext context) {
    return NonActivedPlanWidget(
      child: PlanItemWidget(
        title: PlanTitle(plan, style: style),
        price: PlanPrice(plan,
            translate: translate, energyIcon: energyIcon, style: style),
        property: PlanProperty(plan, translate: translate, style: style),
      ),
    );
  }
}
