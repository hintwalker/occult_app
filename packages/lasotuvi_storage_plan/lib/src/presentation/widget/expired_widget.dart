import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../style/expired_timer_style.dart';

class ExpiredWidget extends StatelessWidget {
  const ExpiredWidget({
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
          color: style.expiredBackground,
          borderRadius: BorderRadius.circular(18.0)),
      child: Row(children: [
        Icon(
          Icons.delete_forever,
          color: style.activeTextColor,
        ),
        const SizedBox(
          width: 8.0,
        ),
        DurationWidget(
          translate: translate,
          style: TextStyle(color: style.expiredTextColor),
          day: days,
          hour: hours,
          minute: minutes,
          second: seconds,
        ),
        // Text('$days ${translate('days')} $hours : $minutes : $seconds',
        //     style: TextStyle(color: style.expiredTextColor))
      ]),
    );
  }
}
