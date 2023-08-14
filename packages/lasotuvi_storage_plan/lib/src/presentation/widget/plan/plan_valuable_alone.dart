import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/plan/non_actived_plan_widget.dart';
import '../action/subscribe_button.dart';
import 'plan_item_widget.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import '../../../entity/storage_plan.dart';
import '../../style/storage_plan_style.dart';
import '../item/plan_price.dart';
import '../item/plan_property.dart';
import '../../../features/plan/widget/plan_list_item_title.dart';

class PlanValuableAlone extends StatelessWidget {
  const PlanValuableAlone({
    super.key,
    required this.translate,
    // required this.colorScheme,
    required this.energyIcon,
    required this.plan,
    required this.currentSubscription,
    required this.style,
    required this.onSubscribeTap,
  });
  final String Function(String) translate;
  // final ColorScheme colorScheme;
  final StoragePlan plan;
  final Subscription currentSubscription;
  final StoragePlanStyle style;
  final Widget energyIcon;
  final void Function() onSubscribeTap;

  @override
  Widget build(BuildContext context) {
    return NonActivedPlanWidget(
      child: PlanItemWidget(
        title: PlanListItemTitle(
          plan,
          style: style.title,
          translate: translate,
        ),
        price: PlanPrice(
          plan,
          translate: translate,
          energyIcon: energyIcon,
          style: style,
        ),
        property: PlanProperty(
          plan,
          translate: translate,
          style: style,
        ),
        action: SubscribeButton(
          translate: translate,
          onTap: onSubscribeTap,
        ),
      ),
    );
  }
}
