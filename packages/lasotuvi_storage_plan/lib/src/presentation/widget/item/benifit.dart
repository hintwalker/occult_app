import 'package:flutter/material.dart';

import '../../../entity/storage_plan.dart';
import '../../style/storage_plan_style.dart';
import 'benifit_detail.dart';

class ItemBenifit extends StatelessWidget {
  const ItemBenifit(
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
        BenifitDetail(
            limitCount: item.limitChart,
            title: translate('chart'),
            style: style),
        BenifitDetail(
            limitCount: item.limitNote, title: translate('note'), style: style),
        BenifitDetail(
            limitCount: item.limitTag, title: translate('tag'), style: style)
      ],
    );
  }
}
