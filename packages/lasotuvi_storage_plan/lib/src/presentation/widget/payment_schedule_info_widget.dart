import 'package:flutter/material.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_utils/tauari_utils.dart';

class PaymentScheduleInfoWidget extends StatelessWidget {
  const PaymentScheduleInfoWidget(
    this.subscription, {
    super.key,
    required this.translate,
  });
  final String Function(String) translate;
  final Subscription subscription;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${translate('paymentNextTime')}:'),
        const SizedBox(
          width: 8.0,
        ),
        Text(dateTimeToString(subscription.expiredDate))
      ],
    );
  }
}
