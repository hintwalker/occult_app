import 'package:flutter/material.dart';

import '../../style/storage_plan_style.dart';

class ExpiredTitle extends StatelessWidget {
  const ExpiredTitle(this.style, {super.key, required this.translate});
  final StoragePlanStyle style;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Text(translate('msgExpiredAt'), style: style.expiredTitle);
  }
}
