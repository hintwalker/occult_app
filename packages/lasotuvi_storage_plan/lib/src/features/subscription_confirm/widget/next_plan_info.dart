import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

class NextPlanInfo extends StatelessWidget {
  const NextPlanInfo({
    super.key,
    required this.plan,
    required this.translate,
    required this.priceStyle,
    required this.titleStyle,
  });
  final StoragePlan plan;
  final String Function(String) translate;
  final TextStyle? titleStyle;
  final TextStyle? priceStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('${translate('plan')} ${plan.title}', style: titleStyle),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(Icons.energy_savings_leaf_outlined, color: priceStyle?.color),
          const SizedBox(
            width: 2.0,
          ),
          Text(
            '${plan.energy} /30 ${translate('day')}',
            style: priceStyle,
          ),
        ]),
      ],
    );
  }
}
