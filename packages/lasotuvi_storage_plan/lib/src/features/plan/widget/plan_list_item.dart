import 'package:flutter/material.dart';

import '../../../entity/storage_plan.dart';
import '../../subscription/widget/subscribe_button.dart';
import '../style/plan_list_item_style.dart';
import '../widget/plan_list_item_price.dart';
import '../widget/plan_list_item_properties.dart';
import 'plan_list_item_title.dart';

class PlanListItem extends StatelessWidget {
  const PlanListItem({
    super.key,
    required this.plan,
    required this.style,
    required this.translate,
    required this.showSubscribeButton,
    required this.onSubscribeButtonTap,
  });
  final StoragePlan plan;
  final PlanListItemStyle style;
  final String Function(String) translate;
  final bool showSubscribeButton;
  final void Function() onSubscribeButtonTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 24.0,
            ),
            PlanListItemTitle(
              plan,
              style: style.title,
              translate: translate,
            ),
            PlanListItemPrice(
              plan,
              translate: translate,
              energyIcon: Icon(
                Icons.energy_savings_leaf_outlined,
                color: style.energyIconColor,
                size: style.energyIconSize,
              ),
              priceValueStyle: style.priceValue,
              periodStyle: style.pricePeriod,
            ),
            const SizedBox(
              width: 12.0,
            ),
            PlanListItemProperties(
              plan,
              translate: translate,
              style: style,
            ),
            const SizedBox(
              width: 12.0,
            ),
            if (showSubscribeButton)
              SubscribeButton(
                translate: translate,
                onTap: onSubscribeButtonTap,
              ),
          ],
        ),
      ),
    );
  }
}
