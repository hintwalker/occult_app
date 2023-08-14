import 'package:flutter/material.dart';
import '../../../entity/storage_plan.dart';
import '../style/plan_list_item_style.dart';
import 'plan_list_item.dart';
import 'plan_list_item_actived_holder.dart';

class PlanListItemWrapper extends StatelessWidget {
  const PlanListItemWrapper({
    super.key,
    required this.isActived,
    required this.translate,
    required this.style,
    required this.plan,
    required this.showSubscribeButton,
    required this.onSubscribeButtonTap,
  });
  final bool isActived;
  final String Function(String) translate;
  final PlanListItemStyle style;
  final StoragePlan plan;
  final bool showSubscribeButton;
  final void Function() onSubscribeButtonTap;

  @override
  Widget build(BuildContext context) {
    return isActived
        ? PlanListItemActivedHolder(
            translate: translate,
            style: style,
            child: PlanListItem(
              plan: plan,
              style: style,
              translate: translate,
              showSubscribeButton: showSubscribeButton,
              onSubscribeButtonTap: onSubscribeButtonTap,
            ),
          )
        : PlanListItem(
            plan: plan,
            style: style,
            translate: translate,
            showSubscribeButton: showSubscribeButton,
            onSubscribeButtonTap: onSubscribeButtonTap,
          );
  }
}
