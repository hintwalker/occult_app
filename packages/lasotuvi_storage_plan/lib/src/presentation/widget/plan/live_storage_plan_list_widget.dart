import 'package:flutter/material.dart';
import '../../../entity/storage_plan_ids.dart';
import '../plan/plan_warning_canceled.dart';
import '../plan/plan_warning_expired.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_ui/tauari_ui.dart';
// import 'package:tauari_utils/tauari_utils.dart';

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
    return BasicFutureBuilder(
        future: controller.allPlans(uid),
        child: (plans) {
          if (plans == null) {
            return const ErrorTextWidget();
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: BasicStreamBuilder(
                stream: currentSubController.onCurrentSub(uid),
                child: (currentSub) => BasicFutureBuilder(
                  future: controller.lastCanceledSubscription.call(uid),
                  child: (lastCanceled) => Column(
                    children: [
                      if (currentSub != null)
                        currentSub.status == SubscriptionStatus.expired
                            ? PlanWariningExpired(
                                translate: translate,
                                style: style,
                                canceledDate: currentSub.expiredDate
                                    .add(TimeConfig.cancelDuration),
                                onExtendsButtonTap: () =>
                                    controller.extendsPlan(currentSub))
                            : lastCanceled != null
                                ? currentSub.planId == StoragePlanIds.free
                                    ? PlanWariningCanceled(
                                        translate: translate,
                                        style: style,
                                        canceledDate: lastCanceled.expiredDate
                                            .add(TimeConfig.cancelDuration),
                                      )
                                    : const SizedBox(
                                        height: 4.0,
                                      )
                                : const SizedBox(
                                    height: 4.0,
                                  ),
                      Expanded(
                        child: StoragePlanList(
                          plans: plans,
                          // onRegister: onRegister,
                          translate: translate,
                          style: style,
                          energyIcon: energyIcon,
                          expiredTimerController: expiredTimerController,
                          // activedPlanId: activedPlanId,
                          // previousPlanId: previousPlanId,
                          subscription: currentSub ?? Subscription.free(),
                          // uid: uid,
                          controller: controller,
                          lastCanceled: lastCanceled,
                        ),
                      ),
                    ],
                  ),
                ),
                // child: StreamBuilder(
                //     stream: currentSubController.onCurrentSub(uid),
                //     builder: (ctx, currentSub) {
                //       if (currentSub.connectionState == ConnectionState.waiting) {
                //         return const CircularProgressIndicator();
                //       } else if (currentSub.hasData) {
                //         return AdvancedFutureBuilder(
                //           future: controller.lastCanceledSubscription.call(uid),
                //           child: (lastCanceled) => StoragePlanList(
                //             plans: plans.requireData,
                //             // onRegister: onRegister,
                //             translate: translate,
                //             style: style,
                //             energyIcon: energyIcon,
                //             expiredTimerController: expiredTimerController,
                //             // activedPlanId: activedPlanId,
                //             // previousPlanId: previousPlanId,
                //             subscription:
                //                 currentSub.requireData ?? Subscription.free(),
                //             // uid: uid,
                //             controller: controller,
                //             lastCanceled: lastCanceled,
                //           ),
                //           // childIfNull: StoragePlanList(
                //           //   plans: plans.requireData,
                //           //   // onRegister: onRegister,
                //           //   translate: translate,
                //           //   style: style,
                //           //   energyIcon: energyIcon,
                //           //   expiredTimerController: expiredTimerController,
                //           //   // activedPlanId: activedPlanId,
                //           //   // previousPlanId: previousPlanId,
                //           //   subscription:
                //           //       currentSub.requireData ?? Subscription.free(),
                //           //   // uid: uid,
                //           //   controller: controller,
                //           //   lastCanceled: null,
                //           // )
                //         );
                //       } else {
                //         return const Center(child: SimpleErrorWidget());
                //       }
                //     }),
              ),
            );
          }
        });
  }
}
