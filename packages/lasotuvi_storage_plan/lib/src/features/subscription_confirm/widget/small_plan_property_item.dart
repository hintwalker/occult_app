import 'package:flutter/material.dart';

import '../style/subscription_confirm_style.dart';

class SmallPlanPropertyItem extends StatelessWidget {
  const SmallPlanPropertyItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.maxValue,
    required this.style,
  });

  final IconData icon;
  final String title;
  final int value;
  final int maxValue;
  final SubscriptionConfirmStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: style.propertyName?.color,
          size: style.propertyIconSize,
        ),
        const SizedBox(
          width: 4.0,
        ),
        Text('$title: ', style: style.propertyName),
        Text(
          '$value/$maxValue',
          style: value < maxValue
              ? style.propertyValue
              : style.propertyValueDanger,
        ),
        const SizedBox(
          width: 8.0,
        ),
        SizedBox(
          width: 60,
          height: 14.0,
          // child: Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(16.0),
          //   ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: LinearProgressIndicator(
              value: maxValue != 0 ? value / maxValue : 0,
              color: value < maxValue
                  ? style.propertyValue?.color
                  : style.propertyValueDanger?.color,
            ),
          ),
          // ),
        ),
      ],
    );
  }
}
