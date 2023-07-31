import 'package:flutter/material.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tauari_utils/tauari_utils.dart';

// import '../../entity/storage_plan.dart';
import '../../controller/expired_timer_controller.dart';
import '../../controller/storage_plan_list_controller.dart';
import '../../style/storage_plan_style.dart';
import 'storage_plan_list.dart';

class LiveStoragePlanListWidget extends StatelessWidget {
  const LiveStoragePlanListWidget({
    super.key,
    required this.controller,
    required this.translate,
    required this.energyIcon,
    required this.style,
    required this.expiredTimerController,
    // this.activedPlanId,
    // this.previousPlanId,
    required this.uid,
    required this.currentSubController,
    // required this.onRegister,
  });

  final String? uid;
  final StoragePlanListController controller;
  final String Function(String) translate;
  final Widget energyIcon;
  final StoragePlanStyle style;
  final ExpiredTimerController expiredTimerController;
  // final String? activedPlanId;
  // final String? previousPlanId;
  final CurrentSubController currentSubController;
  // final void Function(StoragePlan) onRegister;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.allPlans(uid),
        builder: (ctx, plans) {
          if (plans.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (plans.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: StreamBuilder(
                  stream: currentSubController.onCurrentSub(uid),
                  builder: (ctx, currentSub) {
                    if (currentSub.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (currentSub.hasData) {
                      return BasicFutureBuilder(
                          future: controller.lastCanceledSubscription.call(uid),
                          child: (lastCanceled) => StoragePlanList(
                                plans: plans.requireData,
                                // onRegister: onRegister,
                                translate: translate,
                                style: style,
                                energyIcon: energyIcon,
                                expiredTimerController: expiredTimerController,
                                // activedPlanId: activedPlanId,
                                // previousPlanId: previousPlanId,
                                subscription: currentSub.requireData ??
                                    Subscription.free(),
                                // uid: uid,
                                controller: controller,
                                lastCanceled: lastCanceled,
                              ),
                          childIfNull: StoragePlanList(
                            plans: plans.requireData,
                            // onRegister: onRegister,
                            translate: translate,
                            style: style,
                            energyIcon: energyIcon,
                            expiredTimerController: expiredTimerController,
                            // activedPlanId: activedPlanId,
                            // previousPlanId: previousPlanId,
                            subscription:
                                currentSub.requireData ?? Subscription.free(),
                            // uid: uid,
                            controller: controller,
                            lastCanceled: null,
                          ));
                    } else {
                      return const Center(child: SimpleErrorWidget());
                    }
                  }),
            );
          } else {
            return const Center(
              child: Text('!'),
            );
          }
        });
  }
}
