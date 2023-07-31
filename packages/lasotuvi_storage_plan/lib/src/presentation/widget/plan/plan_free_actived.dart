import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/plan/actived_plan_widget.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/plan/plan_item_widget.dart';

class PlanFreeActived extends StatelessWidget {
  const PlanFreeActived({
    super.key,
    required this.translate,
    // required this.colorScheme,
    required this.plan,
    required this.style,
  });
  final String Function(String) translate;
  // final ColorScheme colorScheme;
  final StoragePlan plan;
  final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return ActivedPlanWidget(
      translate: translate,
      style: style,
      child: PlanItemWidget(
        title: PlanTitle(plan, style: style),
        price: Text(
          translate('free'),
          style: style.price,
        ),
        property: PlanProperty(plan, translate: translate, style: style),
      ),
    );
  }
}
