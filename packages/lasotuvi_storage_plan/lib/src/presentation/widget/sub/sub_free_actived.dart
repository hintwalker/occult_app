import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../../widget/action/upgrade_plan_button.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../item/subscription_title.dart';
import '../timer/timer_title_widget.dart';

class SubFreeActived extends StatelessWidget {
  const SubFreeActived({
    super.key,
    required this.plan,
    required this.translate,
    required this.style,
    required this.energyIcon,
    required this.onUpgradeTap,
    required this.lastCanceled,
  });
  final StoragePlan plan;
  final String Function(String) translate;
  final StoragePlanStyle style;
  final Widget energyIcon;
  final Subscription? lastCanceled;
  final void Function() onUpgradeTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SubscriptionTitle(
          plan: plan,
          translate: translate,
          energyIcon: energyIcon,
          style: style,
        ),
        const SizedBox(
          height: 8.0,
        ),
        lastCanceled == null
            ? const SizedBox.shrink()
            : TimerTitleWidget(
                translate('lastPackageCanceledAt'),
                style: style.canceledTitle,
              ),
        lastCanceled == null
            ? const SizedBox.shrink()
            : CanceledDateTime(lastCanceled!, style: style),
        const SizedBox(
          height: 12.0,
        ),
        UpgradePlanButton(
          translate: translate,
          onTap: onUpgradeTap,
        )
      ],
    );
  }
}
