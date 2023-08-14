import 'package:flutter/material.dart';

import '../../../entity/storage_plan.dart';

class PlanListItemPrice extends StatelessWidget {
  const PlanListItemPrice(
    this.item, {
    super.key,
    required this.translate,
    required this.energyIcon,
    required this.priceValueStyle,
    required this.periodStyle,
  });
  final StoragePlan item;
  final String Function(String) translate;
  final Widget energyIcon;
  final TextStyle? priceValueStyle;
  final TextStyle? periodStyle;

  @override
  Widget build(BuildContext context) {
    return item.energy == 0
        ? Text(
            translate('free'),
            style: priceValueStyle,
          )
        : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            energyIcon,
            const SizedBox(
              width: 2.0,
            ),
            Text('${item.energy}', style: priceValueStyle),
            const SizedBox(
              width: 12.0,
            ),
            Text('/ 30 ${translate('days')}', style: periodStyle),
          ]);
  }
}
