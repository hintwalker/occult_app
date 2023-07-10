import 'package:flutter/material.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../style/storage_plan_style.dart';

class ExpiredDateTime extends StatelessWidget {
  const ExpiredDateTime(
    this.subscription, {
    super.key,
    required this.style,
  });
  final Subscription subscription;
  final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return DateTimeWidget(subscription.expiredDate, style: style.expiredTime);
  }
}
