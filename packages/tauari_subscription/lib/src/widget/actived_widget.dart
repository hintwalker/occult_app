import 'package:flutter/material.dart';

import '../style/expired_timer_style.dart';

class ActivedWidget extends StatelessWidget {
  const ActivedWidget({
    super.key,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.status,
    required this.style,
    required this.translate,
  });
  final int days;
  final int hours;
  final int minutes;
  final int seconds;
  final String? status;
  final ExpiredTimerStyle style;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: style.activedBackground,
          borderRadius: BorderRadius.circular(18.0)),
      child: Row(children: [
        Icon(
          Icons.refresh,
          color: style.activeTextColor,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text('$days ${translate('days')} $hours : $minutes : $seconds',
            style: TextStyle(color: style.activeTextColor))
      ]),
    );
  }
}
