import 'package:flutter/material.dart';

import '../../../entity/storage_plan.dart';
import '../../style/storage_plan_style.dart';

class PlanPrice extends StatelessWidget {
  const PlanPrice(
    this.item, {
    super.key,
    required this.translate,
    required this.energyIcon,
    required this.style,
  });
  final StoragePlan item;
  final String Function(String) translate;
  final Widget energyIcon;
  final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return item.energy == 0
        ? Text(
            translate('free'),
            style: style.price,
          )
        : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            energyIcon,
            Text('${item.energy}', style: style.price),
            const SizedBox(
              width: 12.0,
            ),
            Text('/ 30 ${translate('days')}', style: style.period),
          ]);
  }
}
