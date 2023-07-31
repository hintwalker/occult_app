import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

class TimerTitleWidget extends StatelessWidget {
  const TimerTitleWidget(
    this.text, {
    super.key,
    required this.style,
  });
  final String text;
  final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: style.expiredTitle,
        ),
      ],
    );
  }
}
