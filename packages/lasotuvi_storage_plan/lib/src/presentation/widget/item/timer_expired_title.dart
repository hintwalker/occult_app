import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/timer/timer_title_widget.dart';

import '../../style/storage_plan_style.dart';

class TimerExpiredTitle extends StatelessWidget {
  const TimerExpiredTitle({
    super.key,
    required this.translate,
    required this.style,
  });
  final StoragePlanStyle style;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return TimerTitleWidget(translate('msgExpiredAt'), style: style);
  }
}
