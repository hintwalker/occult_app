part of tauari_subscription;

class ExpiredWidget extends StatelessWidget {
  const ExpiredWidget({
    super.key,
    required this.hours,
    required this.minutes,
    required this.seconds,
    required this.status,
    required this.style,
  });
  final int hours;
  final int minutes;
  final int seconds;
  final String? status;
  final ExpiredTimerStyle style;
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
        Text('$hours : $minutes : $seconds',
            style: TextStyle(color: style.expiredTextColor))
      ]),
    );
  }
}
