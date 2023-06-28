part of tuvi_chart_diagram;

class ThanCu extends StatelessWidget {
  const ThanCu(
    this.chart, {
    super.key,
    required this.translate,
  });
  final String Function(String) translate;
  final TuViChart chart;

  @override
  Widget build(BuildContext context) {
    final than = chart.houses[chart.posOfThan]!;
    return Row(
      children: [
        HumanItemTitle(
          'thanCu',
          translate: translate,
        ),
        const SizedBox(
          width: 2,
        ),
        ItemContainer(Text(
          translate(than.name.name),
          style: itemTextStyle,
        ))
      ],
    );
  }
}
