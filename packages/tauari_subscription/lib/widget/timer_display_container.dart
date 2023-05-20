part of tauari_subscription;

class TimerDisplayContainer extends StatefulWidget {
  const TimerDisplayContainer(
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
  final ExpiredTimerStyle style;
  final String? uid;

  @override
  State<StatefulWidget> createState() => _TimerDisplayContainerState();
}

class _TimerDisplayContainerState extends State<TimerDisplayContainer> {
  int days = 0;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  @override
  void initState() {
    super.initState();

    widget.controller.addListener(listen);
    startTimer();
  }

  void listen() {
    if (mounted) {
      setState(() {
        days = widget.controller.days;
        hours = widget.controller.hours;
        minutes = widget.controller.minutes;
        seconds = widget.controller.seconds;
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
  void didUpdateWidget(covariant TimerDisplayContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    // final hours = widget.controller.sel ref
    //     .watch(expiredTimerControllerProvider.select((value) => value.hours));
    // final minutes = ref
    //     .watch(expiredTimerControllerProvider.select((value) => value.minutes));
    // final seconds = ref
    //     .watch(expiredTimerControllerProvider.select((value) => value.seconds));
    // final status = ref
    //     .watch(expiredTimerControllerProvider.select((value) => value.status));

    return widget.subscription == null
        ? const SizedBox.shrink()
        : widget.subscription!.status == SubscriptionStatus.canceled
            ? CanceledPreviousAlert(widget.subscription!,
                translate: widget.translate)
            : TimerDisplayWidget(
                days: days,
                hours: hours,
                minutes: minutes,
                seconds: seconds,
                status: widget.subscription!.status,
                style: widget.style,
                translate: widget.translate,
                currentSub: widget.subscription!,
              );
  }
}
