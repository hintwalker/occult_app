import 'package:flutter/material.dart';

import '../../../entity/storage_plan.dart';
import '../../style/storage_plan_style.dart';

class ItemTitle extends StatelessWidget {
  const ItemTitle(
    this.item, {
    super.key,
    required this.style,
  });

  final StoragePlan item;
  final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      item.title,
      style: style.title,
    );
  }
}
