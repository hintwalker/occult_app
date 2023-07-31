import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ExtendsConfirmDialog extends StatelessWidget {
  const ExtendsConfirmDialog({
    super.key,
    required this.subscription,
    required this.translate,
    required this.energyIcon,
    required this.style,
  });
  final String Function(String) translate;
  final Subscription subscription;
  final Widget energyIcon;
  final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return BasicConfirmDialog(
      title: translate('confirm'),
      cancelButtonText: null,
      noButtonText: translate('no'),
      yesButtonText: translate('Extends'),
      children: [
        Text(translate('confirmExtends')),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          energyIcon,
          Text('${subscription.energy}', style: style.price),
          const SizedBox(
            width: 12.0,
          ),
          Text('/ 30 ${translate('days')}', style: style.period),
        ])
      ],
    );
  }
}
