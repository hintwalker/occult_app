import 'package:flutter/material.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ExtendsConfirmDialog extends StatelessWidget {
  const ExtendsConfirmDialog({
    super.key,
    required this.subscription,
    required this.translate,
    required this.energyIcon,
    this.iconColor,
    this.periodTextStyle,
    this.priceValueTextStyle,
    this.titleStyle,
  });
  final String Function(String) translate;
  final Subscription subscription;
  final Widget energyIcon;
  final TextStyle? titleStyle;
  final Color? iconColor;
  final TextStyle? priceValueTextStyle;
  final TextStyle? periodTextStyle;
  // final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return BasicConfirmDialog(
      title: translate('confirm'),
      cancelButtonText: null,
      noButtonText: translate('no'),
      yesButtonText: translate('extends'),
      children: [
        Text(translate('confirmExtends'),
            style: const TextStyle(fontSize: 18.0)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          energyIcon,
          Text('${subscription.energy}', style: priceValueTextStyle),
          const SizedBox(
            width: 12.0,
          ),
          Text('/ 30 ${translate('days')}', style: periodTextStyle),
        ])
      ],
    );
  }
}
