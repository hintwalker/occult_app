part of tauari_subscription;

class ExpiredTimerWidget extends StatelessWidget {
  const ExpiredTimerWidget({
    super.key,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.status,
    required this.style,
    required this.translate,
    required this.currentSub,
  });
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
                  hours: hours,
                  minutes: minutes,
                  seconds: seconds,
                  status: status,
                  style: style,
                )
              : status == SubscriptionStatus.expired
                  ? ExpiredWidget(
                      hours: hours,
                      minutes: minutes,
                      seconds: seconds,
                      status: status,
                      style: style)
                  : CanceledWidget(style: style, translate: translate),
    );
  }
}
