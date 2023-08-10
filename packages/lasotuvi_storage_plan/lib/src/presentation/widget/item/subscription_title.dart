import 'package:flutter/material.dart';
import '../../../entity/storage_plan.dart';
import '../../style/storage_plan_style.dart';

class SubscriptionTitle extends StatelessWidget {
  const SubscriptionTitle({
    super.key,
    required this.plan,
    required this.translate,
    required this.energyIcon,
    required this.style,
  });
  final StoragePlan plan;
  final String Function(String) translate;
  final StoragePlanStyle style;
  final Widget energyIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.cloud,
          color: style.iconColor,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          '${translate('storagePlan')}:',
          style: TextStyle(fontSize: 18.0, color: style.outline),
        ),
        const SizedBox(
          width: 8.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            border: Border.all(color: style.iconColor),
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Row(children: [
            Text(
              plan.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: style.primary),
            ),
            const SizedBox(
              width: 8.0,
            ),
            energyIcon,
            Text(
              plan.energy == 0
                  ? translate('free')
                  : '${plan.energy} /30 ${translate('day')}',
              style: TextStyle(
                fontSize: 16.0,
                color: style.primary,
              ),
            )
          ]),
        )
      ],
    );
  }
}
