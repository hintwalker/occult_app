import 'package:flutter/material.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../style/storage_plan_style.dart';

class ExpiredDuration extends StatefulWidget {
  const ExpiredDuration(
    this.subscription, {
    super.key,
    // required this.onExpired,
    // required this.onCanceled,
    required this.translate,
    required this.controller,
    required this.style,
    this.uid,
  });

  final Subscription? subscription;
  // final void Function(Subscription) onExpired;
  // final void Function(Subscription) onCanceled;
  final String Function(String) translate;
  final ExpiredTimerController controller;
  final StoragePlanStyle style;
  final String? uid;

  @override
  State<ExpiredDuration> createState() => _ExpiredDurationState();
}

class _ExpiredDurationState extends State<ExpiredDuration> {
  int day = 0;
  int hour = 0;
  int minute = 0;
  int second = 0;
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(listen);
    startTimer();
  }

  void listen() {
    if (mounted) {
      setState(() {
        day = widget.controller.days;
        hour = widget.controller.hours;
        minute = widget.controller.minutes;
        second = widget.controller.seconds;
      });
    }
  }

  void startTimer() {
    widget.controller.cancelAllTimer();
    if (widget.subscription == null ||
        widget.subscription!.status == SubscriptionStatus.canceled) {
      return;
    }

    if (widget.subscription != null) {
      widget.controller.startExpiredTimer(widget.subscription!, widget.uid);
    }
  }

  @override
  void dispose() {
    widget.controller.cancelAllTimer();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ExpiredDuration oldWidget) {
    super.didUpdateWidget(oldWidget);
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return DurationWidget(
        translate: widget.translate,
        style: widget.style.expiredTime,
        day: day,
        hour: hour,
        minute: minute,
        second: second);
  }
}
