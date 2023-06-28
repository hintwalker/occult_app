part of tuvi_chart_diagram;

class HouseMonthView extends StatelessWidget {
  const HouseMonthView(
    this.data, {
    super.key,
    required this.translate,
  });
  final int data;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      '$data',
      style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
      minFontSize: 7,
      maxFontSize: 9,
    );
  }
}
