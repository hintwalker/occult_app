import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/src/features/plan/widget/extends_plan_button.dart';
// import '../item/timer_usage_title.dart';
import '../../controller/expired_timer_controller.dart';
import '../../controller/storage_plan_list_controller.dart';
import '../item/subscription_title.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../../entity/storage_plan.dart';
import '../../style/storage_plan_style.dart';
import '../item/will_cancel_title.dart';
import '../timer/timer_value_widget.dart';

class SubValuableExpired extends StatelessWidget {
  const SubValuableExpired({
    super.key,
    required this.plan,
    required this.subscription,
    required this.translate,
    required this.style,
    required this.energyIcon,
    required this.timerController,
    required this.planController,
    required this.onExtendsTap,
  });
  final StoragePlan plan;
  final Subscription subscription;
  final String Function(String) translate;
  final StoragePlanStyle style;
  final Widget energyIcon;
  final ExpiredTimerController timerController;
  final StoragePlanListController planController;
  final void Function() onExtendsTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SubscriptionTitle(
            plan: plan,
            translate: translate,
            energyIcon: energyIcon,
            style: style),
        const SizedBox(
          height: 8.0,
        ),
        WillCancelTitle(style: style, translate: translate),
        TimerValueWidget(
          subscription,
          translate: translate,
          timerController: timerController,
          planController: planController,
          style: style,
          energyIcon: energyIcon,
        ),
        const SizedBox(
          height: 18.0,
        ),
        ExtendsPlanButton(
          translate: translate,
          onTap: onExtendsTap,
        ),
      ],
    );
  }
}
