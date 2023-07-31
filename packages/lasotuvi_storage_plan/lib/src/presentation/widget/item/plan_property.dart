import 'package:flutter/material.dart';

import '../../../entity/storage_plan.dart';
import '../../style/storage_plan_style.dart';
import 'plan_property_item.dart';

class PlanProperty extends StatelessWidget {
  const PlanProperty(
    this.item, {
    super.key,
    required this.translate,
    required this.style,
  });
  final StoragePlan item;
  final String Function(String) translate;
  final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlanPropertyItem(
            limitCount: item.limitChart,
            title: translate('chart'),
            style: style),
        PlanPropertyItem(
            limitCount: item.limitNote, title: translate('note'), style: style),
        PlanPropertyItem(
            limitCount: item.limitTag, title: translate('tag'), style: style)
      ],
    );
  }
}
