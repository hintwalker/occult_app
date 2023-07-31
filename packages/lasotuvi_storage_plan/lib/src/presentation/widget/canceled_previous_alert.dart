import 'package:flutter/material.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_utils/tauari_utils.dart';

class CanceledPreviousAlert extends StatelessWidget {
  const CanceledPreviousAlert(
    this.subscription, {
    super.key,
    required this.translate,
  });
  final Subscription subscription;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    final canceledDate =
        subscription.expiredDate.add(TimeConfig.cancelDuration);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            translate('alertPreviousSubCanceled'),
            style: const TextStyle(
              height: 1.2,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          // const SizedBox(
          //   height: 0.0,
          // ),
          Text(
            dateTimeToString(canceledDate),
            style: const TextStyle(
              height: 1.2,
              fontStyle: FontStyle.italic,
            ),
          )
        ],
      ),
    );
  }
}
