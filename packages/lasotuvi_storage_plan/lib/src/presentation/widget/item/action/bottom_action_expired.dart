import 'package:flutter/material.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../../../entity/storage_plan.dart';
import '../../../style/storage_plan_style.dart';
import '../expired_duration.dart';

class BottomActionExpired extends StatelessWidget {
  const BottomActionExpired(
    this.subscription, {
    super.key,
    required this.translate,
    required this.style,
    required this.expiredTimerController,
    required this.plan,
    required this.onExtends,
  });
  final String Function(String) translate;
  final StoragePlanStyle style;
  final Subscription subscription;
  final ExpiredTimerController expiredTimerController;
  final StoragePlan plan;
  final void Function() onExtends;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          translate('msgExpired'),
          style: style.expiredTitle,
        ),
        DateTimeWidget(subscription.expiredDate, style: style.expiredTime),
        Text(translate('msgWillCancel'), style: style.willCancelTitle),
        ExpiredDuration(subscription,
            translate: translate,
            controller: expiredTimerController,
            style: style),
        const SizedBox(
          height: 18.0,
        ),
        FilledButton(
            onPressed: onExtends,
            child: Text('${translate('extendPackage')} ${plan.title}'))
      ],
    );
  }
}
