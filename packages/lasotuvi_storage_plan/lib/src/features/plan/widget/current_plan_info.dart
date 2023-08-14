import 'package:flutter/material.dart';

import '../../../entity/storage_plan.dart';
import '../style/current_plan_style.dart';

class CurrentPlanInfo extends StatelessWidget {
  const CurrentPlanInfo({
    super.key,
    required this.plan,
    required this.translate,
    this.style,
  });
  final StoragePlan plan;
  final String Function(String) translate;
  final CurrentPlanStyle? style;

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: style?.planInfoBackground,
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Chip(
            label: Text(
              plan.title,
              style: style?.planNameStyle,
            ),
            padding: const EdgeInsets.symmetric(vertical: 0.0),
          ),
          const SizedBox(
            width: 4.0,
          ),
          Icon(
            Icons.energy_savings_leaf_outlined,
            color: style?.energyIconColor,
            size: style?.energyIconSize,
          ),
          const SizedBox(
            width: 2.0,
          ),
          Text(
            '${plan.energy} /30 ${translate('day')}',
            style: style?.priceStyle,
          )
        ],
      ),
    );
  }
}
