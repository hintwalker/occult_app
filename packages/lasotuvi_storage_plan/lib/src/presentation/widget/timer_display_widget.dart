import 'package:flutter/material.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'expired_widget.dart';

import '../style/expired_timer_style.dart';
import 'actived_widget.dart';
import 'canceled_widget.dart';

class TimerDisplayWidget extends StatelessWidget {
  const TimerDisplayWidget({
    super.key,
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.status,
    required this.style,
    required this.translate,
    required this.currentSub,
  });
  final int days;
  final int hours;
  final int minutes;
  final int seconds;
  final String? status;
  final ExpiredTimerStyle style;
  final String Function(String) translate;
  final Subscription currentSub;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: status == null
          ? const CircularProgressIndicator()
          : status == SubscriptionStatus.actived
              ? ActivedWidget(
                  days: days,
                  hours: hours,
                  minutes: minutes,
                  seconds: seconds,
                  status: status,
                  style: style,
                  translate: translate,
                )
              : status == SubscriptionStatus.expired
                  ? ExpiredWidget(
                      days: days,
                      hours: hours,
                      minutes: minutes,
                      seconds: seconds,
                      status: status,
                      style: style,
                      translate: translate,
                    )
                  : CanceledWidget(style: style, translate: translate),
    );
  }
}
