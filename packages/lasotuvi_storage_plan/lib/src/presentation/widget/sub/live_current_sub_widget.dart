import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/sub/current_sub_warpper.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../../entity/storage_plan.dart';
import '../../controller/expired_timer_controller.dart';
import '../../controller/storage_plan_list_controller.dart';
import '../../style/storage_plan_style.dart';

class LiveCurrentSubWidget extends StatelessWidget {
  const LiveCurrentSubWidget({
    super.key,
    required this.uid,
    required this.planController,
    required this.translate,
    required this.energyIcon,
    required this.style,
    required this.timerController,
    required this.currentSubController,
    required this.navigateToPlanMarket,
  });
  final String? uid;
  final StoragePlanListController planController;
  final String Function(String) translate;
  final Widget energyIcon;
  final StoragePlanStyle style;
  final ExpiredTimerController timerController;
  final CurrentSubController currentSubController;
  final void Function() navigateToPlanMarket;

  @override
  Widget build(BuildContext context) {
    return BasicStreamBuilder(
        stream: currentSubController.onCurrentSub(uid),
        child: (currentSubSnapshot) => BasicFutureBuilder(
              future: planController.lastCanceledSubscription(uid),
              child: (lastCanceled) {
                final currentSub = currentSubSnapshot ?? Subscription.free();
                return BasicFutureBuilder(
                  future:
                      planController.takeCurrentPlan(uid, currentSub.planId),
                  child: (currentPlan) => CurrentSubWrapper(
                      currentSubscription: currentSub,
                      lastCanceled: lastCanceled,
                      style: style,
                      translate: translate,
                      timerController: timerController,
                      energyIcon: energyIcon,
                      plan: currentPlan ?? StoragePlan.free(),
                      planController: planController,
                      navigateToPlanMarket: navigateToPlanMarket),
                );
              },
            ));
  }
}
