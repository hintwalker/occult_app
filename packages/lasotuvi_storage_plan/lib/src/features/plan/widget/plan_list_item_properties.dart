import 'package:flutter/material.dart';

import '../../../entity/storage_plan.dart';
import '../style/plan_list_item_style.dart';
import 'plan_property_item.dart';

class PlanListItemProperties extends StatelessWidget {
  const PlanListItemProperties(
    this.item, {
    super.key,
    required this.translate,
    required this.style,
  });
  final StoragePlan item;
  final String Function(String) translate;
  final PlanListItemStyle style;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlanPropertyItem(
          limitCount: item.limitChart,
          title: translate('chart'),
          iconColor: style.propertyIconColor,
          propertyIcon: Icon(
            Icons.badge,
            color: style.propertyIconColor,
          ),
          benifitStyle: style.benifit,
        ),
        PlanPropertyItem(
          limitCount: item.limitNote,
          title: translate('note'),
          iconColor: style.propertyIconColor,
          propertyIcon: Icon(
            Icons.sticky_note_2,
            color: style.propertyIconColor,
          ),
          benifitStyle: style.benifit,
        ),
        PlanPropertyItem(
          limitCount: item.limitTag,
          title: translate('tag'),
          iconColor: style.propertyIconColor,
          propertyIcon: Icon(
            Icons.label,
            color: style.propertyIconColor,
          ),
          benifitStyle: style.benifit,
        )
      ],
    );
  }
}
