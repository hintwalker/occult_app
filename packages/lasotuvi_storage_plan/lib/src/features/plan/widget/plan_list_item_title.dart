import 'package:flutter/material.dart';

import '../../../entity/storage_plan.dart';

class PlanListItemTitle extends StatelessWidget {
  const PlanListItemTitle(
    this.item, {
    super.key,
    required this.style,
    required this.translate,
  });

  final StoragePlan item;
  final TextStyle? style;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${translate('plan')} ${item.title}',
      style: style,
    );
  }
}
