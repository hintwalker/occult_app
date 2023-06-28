part of tuvi_chart_diagram;

class HumanLuniSolar extends StatelessWidget {
  const HumanLuniSolar(this.birthday, {super.key, required this.translate});
  final String Function(String) translate;
  final Moment birthday;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HumanItemTitle(
          'amLich',
          translate: translate,
        ),
        HumanLuniSolarDate(
          birthday,
          translate: translate,
        )
      ],
    );
  }
}
