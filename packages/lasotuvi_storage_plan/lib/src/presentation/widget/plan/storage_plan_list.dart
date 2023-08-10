import 'package:flutter/material.dart';
// import 'package:tauari_ui/tauari_ui.dart';
import 'plan_list_item_wrapper.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../../entity/storage_plan.dart';
// import '../../../entity/storage_plan_ids.dart';
import '../../controller/expired_timer_controller.dart';
import '../../controller/storage_plan_list_controller.dart';
import '../../style/storage_plan_style.dart';
// import 'storage_plan_list_item.dart';

class StoragePlanList extends StatelessWidget {
  const StoragePlanList({
    super.key,
    required this.plans,
    // this.activedPlanId,
    // this.previousPlanId,
    // required this.onRegister,
    required this.translate,
    required this.energyIcon,
    required this.style,
    required this.expiredTimerController,
    required this.subscription,
    required this.lastCanceled,
    required this.controller,
    required this.willSubscribe,
    // this.uid,
  });
  final Iterable<StoragePlan> plans;
  final String Function(String) translate;
  final Widget energyIcon;
  final StoragePlanStyle style;
  final ExpiredTimerController expiredTimerController;
  final StoragePlanListController controller;
  final Subscription subscription;
  final Subscription? lastCanceled;
  final Future<bool> Function(BuildContext context, StoragePlan plan)
      willSubscribe;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 92.0),
        itemCount: plans.length,
        itemBuilder: (ctx, index) {
          // final docId = plans.elementAt(index).docId;
          return PlanListItemWrapper(
            currentSubscription: subscription,
            lastCanceled: lastCanceled,
            style: style,
            translate: translate,
            timerController: expiredTimerController,
            energyIcon: energyIcon,
            plan: plans.elementAt(index),
            planController: controller,
            willSubscribe: willSubscribe,
          );
        });
  }
}
