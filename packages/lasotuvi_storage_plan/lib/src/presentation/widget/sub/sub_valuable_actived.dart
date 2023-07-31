import 'package:flutter/material.dart';
import '../item/timer_usage_title.dart';
import '../../controller/expired_timer_controller.dart';
import '../../controller/storage_plan_list_controller.dart';
import '../item/subscription_title.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../../entity/storage_plan.dart';
import '../../style/storage_plan_style.dart';
import '../timer/timer_value_widget.dart';

class SubValuableActived extends StatelessWidget {
  const SubValuableActived({
    super.key,
    required this.plan,
    required this.subscription,
    required this.translate,
    required this.style,
    required this.energyIcon,
    required this.timerController,
    required this.planController,
  });
  final StoragePlan plan;
  final Subscription subscription;
  final String Function(String) translate;
  final StoragePlanStyle style;
  final Widget energyIcon;
  final ExpiredTimerController timerController;
  final StoragePlanListController planController;
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
        TimerUsageTitle(style: style, translate: translate),
        TimerValueWidget(
          subscription,
          translate: translate,
          timerController: timerController,
          planController: planController,
          style: style,
          energyIcon: energyIcon,
        )
      ],
    );
  }
}
