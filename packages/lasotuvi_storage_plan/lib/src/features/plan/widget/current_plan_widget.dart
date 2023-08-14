import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/src/features/plan/widget/extends_plan_button.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../../entity/storage_plan.dart';
import '../widget/current_plan_expired_date.dart';
import '../style/current_plan_style.dart';
import 'current_plan_info.dart';
import 'current_plan_title.dart';
import 'upgrade_plan_button.dart';

class CurrentPlanWidget extends StatelessWidget {
  const CurrentPlanWidget({
    super.key,
    required this.currentSubscription,
    required this.showPlanList,
    required this.plan,
    required this.showUpgradeButton,
    required this.style,
    required this.translate,
    required this.showExtendsButton,
    required this.showExtendsConfirm,
    required this.hasExpired,
  });
  final String Function(String) translate;
  final void Function() showPlanList;
  final CurrentPlanStyle style;
  final StoragePlan plan;
  final Subscription? currentSubscription;
  final bool hasExpired;
  final bool showUpgradeButton;
  final bool showExtendsButton;
  final Future<bool> Function(Subscription) showExtendsConfirm;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: showPlanList,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cloud,
                    color: style.iconColor,
                    size: style.iconSize,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  CurrentPlanTitle(
                    translate: translate,
                    style: style.titleStyle,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  CurrentPlanInfo(
                    plan: plan,
                    translate: translate,
                    style: style,
                  ),
                ],
              ),
              const SizedBox(
                height: 2.0,
              ),
              CurrentPlanExpiredDate(
                subscription: currentSubscription,
                translate: translate,
                style: style,
                hasExpired: hasExpired,
              ),
              const SizedBox(
                height: 4.0,
              ),
              if (showUpgradeButton)
                UpgradePlanButton(
                  translate: translate,
                  onTap: showPlanList,
                ),
              if (showExtendsButton)
                ExtendsPlanButton(
                  translate: translate,
                  onTap: () {
                    if (currentSubscription != null) {
                      showExtendsConfirm(currentSubscription!);
                    }
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
