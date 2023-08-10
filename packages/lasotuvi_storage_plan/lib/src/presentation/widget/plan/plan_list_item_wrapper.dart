import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/plan/plan_free_actived.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/plan/plan_valuable_actived.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/plan/plan_valuable_alone.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/plan/plan_valuable_expired.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/plan/plan_valuable_stoped_extends.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../../entity/storage_plan.dart';
import '../../../entity/storage_plan_ids.dart';
import '../../controller/expired_timer_controller.dart';
import '../../controller/storage_plan_list_controller.dart';
import '../../style/storage_plan_style.dart';
import 'plan_free_alone.dart';
import 'plan_valuable_canceled.dart';

class PlanListItemWrapper extends StatelessWidget {
  const PlanListItemWrapper({
    super.key,
    required this.currentSubscription,
    required this.lastCanceled,
    required this.style,
    required this.translate,
    required this.timerController,
    required this.energyIcon,
    required this.plan,
    required this.planController,
    required this.willSubscribe,
    // required this.onSubscribeTap,
    // required this.onCancelExtendsTap,
    // required this.onExtendsTap,
  });
  final Subscription currentSubscription;
  final Subscription? lastCanceled;
  final String Function(String) translate;
  final StoragePlanStyle style;
  final ExpiredTimerController timerController;
  final StoragePlan plan;
  final StoragePlanListController planController;
  final Widget energyIcon;
  final Future<bool> Function(BuildContext context, StoragePlan plan)
      willSubscribe;
  // final void Function(StoragePlan plan) onSubscribeTap;
  // final void Function(Subscription subscription) onCancelExtendsTap;
  // final void Function(Subscription subscription) onExtendsTap;

  @override
  Widget build(BuildContext context) {
    final type = getWidgetType(
      currentSub: currentSubscription,
      lastCanceled: lastCanceled,
      plan: plan,
    );
    switch (type) {
      case PlanItemType.freeActived:
        return PlanFreeActived(
          translate: translate,
          plan: plan,
          style: style,
        );
      case PlanItemType.freeAlone:
        return PlanFreeAlone(
          translate: translate,
          energyIcon: energyIcon,
          plan: plan,
          style: style,
        );
      case PlanItemType.actived:
        return PlanValuableActived(
          translate: translate,
          energyIcon: energyIcon,
          plan: plan,
          currentSubscription: currentSubscription,
          style: style,
          timerController: timerController,
          planController: planController,
          onCancelExtendsTap: () =>
              planController.unSubscribe(currentSubscription),
        );
      case PlanItemType.alone:
        return PlanValuableAlone(
          translate: translate,
          energyIcon: energyIcon,
          plan: plan,
          currentSubscription: currentSubscription,
          style: style,
          onSubscribeTap: () => onSubscribe(context, plan),
        );
      case PlanItemType.canceled:
        return PlanValuableCanceled(
          translate: translate,
          energyIcon: energyIcon,
          plan: plan,
          currentSubscription: currentSubscription,
          lastCanceled: lastCanceled,
          style: style,
          onSubscribeTap: () => onSubscribe(context, plan),
        );
      case PlanItemType.stopedExtends:
        return PlanValuableStopedExtends(
          translate: translate,
          energyIcon: energyIcon,
          plan: plan,
          currentSubscription: currentSubscription,
          style: style,
          timerController: timerController,
          planController: planController,
          onContinueExtendsTap: () =>
              planController.continueExtends(currentSubscription),
        );
      case PlanItemType.expired:
      case PlanItemType.keepExpired:
        return PlanValuableExpired(
          translate: translate,
          energyIcon: energyIcon,
          plan: plan,
          currentSubscription: currentSubscription,
          style: style,
          timerController: timerController,
          planController: planController,
          onExtendsTap: () => planController.extendsPlan(currentSubscription),
        );
    }
  }

  PlanItemType getWidgetType({
    required Subscription currentSub,
    required Subscription? lastCanceled,
    required StoragePlan plan,
  }) {
    if (currentSub.planId == StoragePlanIds.free) {
      if (lastCanceled == null) {
        if (plan.id == StoragePlanIds.free) {
          return PlanItemType.freeActived;
        } else {
          return PlanItemType.alone;
        }
      } else {
        // Neu lastCanceled khong = null
        if (plan.id == StoragePlanIds.free) {
          return PlanItemType.freeActived;
        } else {
          if (plan.id == lastCanceled.planId) {
            return PlanItemType.canceled;
          } else {
            return PlanItemType.alone;
          }
        }
      }
    } else {
      // Neu currentSub khong phai free
      if (lastCanceled == null) {
        if (currentSub.status == SubscriptionStatus.actived) {
          if (plan.id == StoragePlanIds.free) {
            return PlanItemType.freeAlone;
          } else if (plan.id == currentSub.planId) {
            return PlanItemType.actived;
          } else {
            // plan khac
            return PlanItemType.alone;
          }
        } else if (currentSub.status == SubscriptionStatus.cancelExtend) {
          if (plan.id == StoragePlanIds.free) {
            return PlanItemType.freeAlone;
          } else if (plan.id == currentSub.planId) {
            return PlanItemType.stopedExtends;
          } else {
            // plan khac
            return PlanItemType.alone;
          }
        } else {
          // currentSub expired
          if (plan.id == StoragePlanIds.free) {
            return PlanItemType.freeActived;
          } else if (plan.id == currentSub.planId) {
            return PlanItemType.expired;
          } else {
            // plan khac
            return PlanItemType.alone;
          }
        }
      } else {
        // Neu last canceled khong = null
        if (currentSub.status == SubscriptionStatus.actived) {
          if (plan.id == StoragePlanIds.free) {
            return PlanItemType.freeAlone;
          } else if (plan.id == currentSub.planId) {
            return PlanItemType.actived;
          }
          // else if (plan.id == lastCanceled.planId) {
          //   return PlanItemType.canceled;
          // }
          else {
            // plan khac
            return PlanItemType.alone;
          }
        } else if (currentSub.status == SubscriptionStatus.cancelExtend) {
          if (plan.id == StoragePlanIds.free) {
            return PlanItemType.freeAlone;
          } else if (plan.id == currentSub.planId) {
            return PlanItemType.stopedExtends;
          }
          // else if (plan.id == lastCanceled.planId) {
          //   return PlanItemType.canceled;
          // }
          else {
            // plan khac
            return PlanItemType.alone;
          }
        } else {
          // currentSub expired
          if (plan.id == StoragePlanIds.free) {
            return PlanItemType.freeActived;
          } else if (plan.id == currentSub.planId) {
            return PlanItemType.expired;
          }
          // else if (plan.id == lastCanceled.planId) {
          //   return PlanItemType.canceled;
          // }
          else {
            // plan khac
            return PlanItemType.alone;
          }
        }
      }
    }
  }

  void onSubscribe(BuildContext context, StoragePlan plan) async {
    if (await willSubscribe(context, plan)) {
      await planController.subscribe(plan);
    }
  }

//   Future<void> onSubscribe(StoragePlan plan,
//       {required BuildContext context}) async {

//         final result = showDialog(context: context, builder: (ctx)  =>
//         BasicDialog(title: translate('confirm'), children: [
//           SubscriptionConfirmScreenContent(state: state, translate: translate, onSubmit: onSubmit, onBuyMoreEnergy: onBuyMoreEnergy)
//         ]));
//     await planController.subscribe(plan);
//   }
}

enum PlanItemType {
  freeActived,
  freeAlone,
  actived,
  canceled,
  alone,
  stopedExtends,
  keepExpired,
  expired
}
