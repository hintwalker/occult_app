import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/timer/timer_title_widget.dart';

import '../../style/storage_plan_style.dart';

class WillCancelTitle extends StatelessWidget {
  const WillCancelTitle({
    super.key,
    required this.style,
    required this.translate,
  });
  final StoragePlanStyle style;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return TimerTitleWidget(translate('allOverloadDataWillBeDeletedAt'),
        style: style.willCancelTitle);
  }
}
