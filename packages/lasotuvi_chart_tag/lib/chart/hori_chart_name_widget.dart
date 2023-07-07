part of lasotuvi_chart_tag;

class HoriChartNameWidget extends StatelessWidget {
  const HoriChartNameWidget(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 1.2),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
