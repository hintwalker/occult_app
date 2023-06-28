part of lasotuvi_chart;

class HoriChartWatchingYearWidget extends StatelessWidget {
  const HoriChartWatchingYearWidget(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, letterSpacing: 1.6),
    );
  }
}
