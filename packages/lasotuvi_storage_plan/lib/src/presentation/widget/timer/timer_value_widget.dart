import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/src/presentation/widget/dialog/extends_confirm_dialog.dart';
import 'package:tauari_subscription/tauari_subscription.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../controller/expired_timer_controller.dart';
import '../../controller/storage_plan_list_controller.dart';
import '../../style/storage_plan_style.dart';

class TimerValueWidget extends StatefulWidget {
  const TimerValueWidget(
    this.subscription, {
    super.key,
    // required this.onExpired,
    // required this.onCanceled,
    required this.translate,
    required this.timerController,
    required this.planController,
    required this.style,
    required this.energyIcon,
  });

  final Subscription? subscription;
  // final void Function(Subscription) onExpired;
  // final void Function(Subscription) onCanceled;
  final String Function(String) translate;
  final ExpiredTimerController timerController;
  final StoragePlanListController planController;
  final StoragePlanStyle style;
  final Widget energyIcon;

  @override
  State<TimerValueWidget> createState() => _TimerValueWidgetState();
}

class _TimerValueWidgetState extends State<TimerValueWidget> {
  int day = 0;
  int hour = 0;
  int minute = 0;
  int second = 0;
  @override
  void initState() {
    super.initState();

    widget.timerController.addListener(listen);
    // widget.timerController.addListenerOnExpired(listenToExpired);

    // widget.timerController.addListenerOnCanceled(listenToCanceled);
    startTimer();
  }

  void listen() {
    if (mounted) {
      setState(() {
        day = widget.timerController.days;
        hour = widget.timerController.hours;
        minute = widget.timerController.minutes;
        second = widget.timerController.seconds;
      });
    }
  }

  Future<bool> listenToExpired(Subscription subscription) async {
    final result = await showDialog<ConfirmResult>(
      context: context,
      builder: (ctx) => ExtendsConfirmDialog(
        subscription: subscription,
        translate: widget.translate,
        energyIcon: widget.energyIcon,
        style: widget.style,
      ),
      // builder: (ctx) => const BasicConfirmDialog(
      //   title: '',
      //   cancelButtonText: null,
      //   noButtonText: 'No',
      //   yesButtonText: 'Extends',
      //   children: [Text('extends?')],
      // ),
    );
    if (result == null) {
      await widget.planController.makeCurrentSubscriptionExpired(subscription);
    } else if (result.yes) {
      await widget.planController.extendsCurrentSub(subscription);
      return true;
    } else {
      await widget.planController.makeCurrentSubscriptionExpired(subscription);
    }
    return false;
  }

  Future<void> listenToCanceled(Subscription subscription) async {
    await widget.planController.cancelPlan.call(subscription);
  }

  void startTimer() {
    widget.timerController.cancelAllTimer();
    if (widget.subscription == null ||
        widget.subscription!.status == SubscriptionStatus.canceled) {
      return;
    }

    if (widget.subscription != null) {
      widget.timerController.startExpiredTimer(widget.subscription!);
    }
  }

  @override
  void dispose() {
    widget.timerController.cancelAllTimer();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant TimerValueWidget oldWidget) {
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
