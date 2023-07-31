import 'package:flutter/material.dart';
import '../item/timer_usage_title.dart';
import '../../controller/storage_plan_list_controller.dart';
import '../action/continue_extends_button.dart';
import 'plan_item_widget_with_timer.dart';
// import '../timer/timer_title_widget.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import '../../../entity/storage_plan.dart';
import '../../controller/expired_timer_controller.dart';
import '../../style/storage_plan_style.dart';
import 'actived_plan_widget.dart';
import '../item/plan_price.dart';
import '../item/plan_property.dart';
import '../item/plan_title.dart';
import '../timer/timer_value_widget.dart';

class PlanValuableStopedExtends extends StatelessWidget {
  const PlanValuableStopedExtends({
    super.key,
    required this.translate,
    // required this.colorScheme,
    required this.energyIcon,
    required this.plan,
    required this.currentSubscription,
    required this.style,
    required this.timerController,
    required this.planController,
    required this.onCancelExtendsTap,
  });
  final String Function(String) translate;
  // final ColorScheme colorScheme;
  final StoragePlan plan;
  final Subscription currentSubscription;
  final StoragePlanStyle style;
  final Widget energyIcon;
  final ExpiredTimerController timerController;
  final StoragePlanListController planController;
  final void Function() onCancelExtendsTap;

  @override
  Widget build(BuildContext context) {
    return ActivedPlanWidget(
      translate: translate,
      style: style,
      child: PlanItemWidgetWithTimer(
        title: PlanTitle(plan, style: style),
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
        timerTitle: TimerUsageTitle(
          translate: translate,
          style: style,
        ),
        timerValue: TimerValueWidget(
          currentSubscription,
          translate: translate,
          timerController: timerController,
          planController: planController,
          style: style,
          energyIcon: energyIcon,
        ),
        action: ContinueExtendsButton(
          translate: translate,
          onTap: onCancelExtendsTap,
        ),
      ),
    );
  }
}
