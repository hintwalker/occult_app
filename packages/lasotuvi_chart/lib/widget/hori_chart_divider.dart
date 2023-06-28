part of lasotuvi_chart;

class HoriChartDivider extends StatelessWidget {
  const HoriChartDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 2.0,
      width: 120.0,
      child: Divider(
        height: 4.0,
        thickness: 1.0,
        indent: 0.0,
        endIndent: 0.0,
      ),
    );
  }
}
