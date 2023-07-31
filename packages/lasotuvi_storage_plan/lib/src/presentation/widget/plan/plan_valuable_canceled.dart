import 'package:flutter/material.dart';
// import '../timer/static_time_value_widget.dart';
import '../item/canceled_date_time.dart';
import 'non_actived_plan_widget.dart';
import '../action/subscribe_button.dart';
// import 'plan_item_widget.dart';
import 'plan_item_widget_with_timer.dart';
import '../timer/timer_title_widget.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import '../../../entity/storage_plan.dart';
// import '../../controller/expired_timer_controller.dart';
import '../../style/storage_plan_style.dart';
import '../item/plan_price.dart';
import '../item/plan_property.dart';
import '../item/plan_title.dart';

class PlanValuableCanceled extends StatelessWidget {
  const PlanValuableCanceled({
    super.key,
    required this.translate,
    // required this.colorScheme,
    required this.energyIcon,
    required this.plan,
    required this.currentSubscription,
    required this.lastCanceled,
    required this.style,
    // required this.timerController,
    required this.onSubscribeTap,
  });
  final String Function(String) translate;
  // final ColorScheme colorScheme;
  final StoragePlan plan;
  final Subscription currentSubscription;
  final Subscription? lastCanceled;
  final StoragePlanStyle style;
  final Widget energyIcon;
  // final ExpiredTimerController timerController;
  final void Function() onSubscribeTap;

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
        timerTitle: lastCanceled == null
            ? const SizedBox.shrink()
            : TimerTitleWidget(
                translate('cancledAt'),
                style: style,
              ),
        timerValue: lastCanceled == null
            ? const SizedBox.shrink()
            : CanceledDateTime(lastCanceled!, style: style),
        // StaticTimeValueWidget(
        //     dateTime: lastCanceled!.expiredDate.add(
        //       TimeConfig.cancelDuration,
        //     ),
        //     style: style,
        //   ),
        // timerValue: TimerValueWidget(
        //   currentSubscription,
        //   translate: translate,
        //   controller: timerController,
        //   style: style,
        // ),
        action: SubscribeButton(
          translate: translate,
          onTap: onSubscribeTap,
        ),
      ),
    );
  }
}
