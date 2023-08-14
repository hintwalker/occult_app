import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/sub/sub_free_actived.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/sub/sub_valuable_actived.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/sub/sub_valuable_expired.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../../entity/storage_plan.dart';
import '../../../entity/storage_plan_ids.dart';
import '../../controller/expired_timer_controller.dart';
import '../../controller/storage_plan_list_controller.dart';
import '../../style/storage_plan_style.dart';
import '../dialog/extends_confirm_dialog.dart';

class CurrentSubWrapper extends StatelessWidget {
  const CurrentSubWrapper({
    super.key,
    required this.currentSubscription,
    required this.lastCanceled,
    required this.style,
    required this.translate,
    required this.timerController,
    required this.energyIcon,
    required this.plan,
    required this.planController,
    required this.navigateToPlanMarket,
  });
  final Subscription currentSubscription;
  final Subscription? lastCanceled;
  final String Function(String) translate;
  final StoragePlanStyle style;
  final ExpiredTimerController timerController;
  final StoragePlan plan;
  final StoragePlanListController planController;
  final Widget energyIcon;
  final void Function() navigateToPlanMarket;

  @override
  Widget build(BuildContext context) {
    final widgetType = getWidgetType(currentSub: currentSubscription);

    switch (widgetType) {
      case CurrentSubType.freeActived:
        return SubFreeActived(
          plan: plan,
          translate: translate,
          style: style,
          energyIcon: energyIcon,
          onUpgradeTap: navigateToPlanMarket,
          lastCanceled: lastCanceled,
        );
      case CurrentSubType.actived:
        return SubValuableActived(
          plan: plan,
          subscription: currentSubscription,
          translate: translate,
          style: style,
          energyIcon: energyIcon,
          timerController: timerController,
          planController: planController,
        );
      case CurrentSubType.expired:
        return SubValuableExpired(
          plan: plan,
          subscription: currentSubscription,
          translate: translate,
          style: style,
          energyIcon: energyIcon,
          timerController: timerController,
          planController: planController,
          onExtendsTap: () => onExtendsTap(context),
        );
    }
  }

  void onExtendsTap(BuildContext context) async {
    final result = await showDialog<ConfirmResult>(
      context: context,
      builder: (_) => ExtendsConfirmDialog(
        subscription: currentSubscription,
        translate: translate,
        energyIcon: energyIcon,
        style: style,
      ),
    );
    if (result == null) {
      await planController.makeCurrentSubscriptionExpired(currentSubscription);
    } else if (result.yes) {
      await planController.extendsCurrentSub(currentSubscription);
    } else {
      await planController.makeCurrentSubscriptionExpired(currentSubscription);
    }
  }

  CurrentSubType getWidgetType({
    required Subscription currentSub,
  }) {
    if (currentSub.planId == StoragePlanIds.free) {
      return CurrentSubType.freeActived;
    } else {
      // not free
      if (currentSub.status == SubscriptionStatus.actived ||
          currentSub.status == SubscriptionStatus.cancelExtend) {
        return CurrentSubType.actived;
      } else {
        return CurrentSubType.expired;
      }
    }
  }
}

enum CurrentSubType { freeActived, actived, expired }
