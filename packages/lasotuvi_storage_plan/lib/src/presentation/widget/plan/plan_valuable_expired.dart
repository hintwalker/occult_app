import 'package:flutter/material.dart';
import '../item/will_cancel_title.dart';
import '../../controller/storage_plan_list_controller.dart';
import '../action/extends_plan_button.dart';
// import '../item/timer_expired_title.dart';
// import '../item/will_cancel_title.dart';
// import '../item/expired_date_time.dart';
// import '../item/timer_expired_title.dart';
import '../timer/timer_value_widget.dart';
import 'non_actived_plan_widget.dart';
import 'plan_item_widget_with_timer.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import '../../../entity/storage_plan.dart';
import '../../controller/expired_timer_controller.dart';
import '../../style/storage_plan_style.dart';
import '../item/plan_price.dart';
import '../item/plan_property.dart';
import '../item/plan_title.dart';
// import '../timer/timer_value_widget.dart';

class PlanValuableExpired extends StatelessWidget {
  const PlanValuableExpired({
    super.key,
    required this.translate,
    // required this.colorScheme,
    required this.energyIcon,
    required this.plan,
    required this.currentSubscription,
    required this.style,
    required this.timerController,
    required this.planController,
    required this.onExtendsTap,
  });
  final String Function(String) translate;
  // final ColorScheme colorScheme;
  final StoragePlan plan;
  final Subscription currentSubscription;
  final StoragePlanStyle style;
  final Widget energyIcon;
  final ExpiredTimerController timerController;
  final StoragePlanListController planController;
  final void Function() onExtendsTap;

  @override
  Widget build(BuildContext context) {
    return NonActivedPlanWidget(
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
        timerTitle: WillCancelTitle(
          translate: translate,
          style: style,
        ),
        // timerValue: ExpiredDateTime(currentSubscription, style: style),
        timerValue: TimerValueWidget(
          currentSubscription,
          translate: translate,
          timerController: timerController,
          planController: planController,
          energyIcon: energyIcon,
          style: style,
        ),
        action: ExtendsPlanButton(
          translate: translate,
          onTap: onExtendsTap,
        ),
      ),
    );
  }
}
