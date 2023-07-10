import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tauari_utils/tauari_utils.dart';

import '../config/time_config.dart';
import '../entity/subscription.dart';

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
    final canceledDate = subscription.expiredDate.add(kDebugMode
        ? TimeConfig.debugCancelDuration
        : TimeConfig.cancelDuration);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(translate('alertPreviousSubCanceled')),
          const SizedBox(
            height: 8.0,
          ),
          Text(dateTimeToString(canceledDate))
        ],
      ),
    );
  }
}
