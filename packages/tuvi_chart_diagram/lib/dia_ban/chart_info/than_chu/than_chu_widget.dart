part of tuvi_chart_diagram;

class ThanChuWidget extends StatelessWidget {
  const ThanChuWidget(
    this.bornYear, {
    super.key,
    required this.translate,
  });
  final String Function(String) translate;
  final int bornYear;

  @override
  Widget build(BuildContext context) {
    final chiOfBornYear = Chi.ofLuniYear(bornYear);
    final data = thanChu(chiOfBornYear);
    return Row(
      children: [
        HumanItemTitle('thanChu', translate: translate),
        const SizedBox(
          width: 2,
        ),
        ItemContainer(Text(
          translate(data.name),
          style: itemTextStyle,
        ))
      ],
    );
  }
}
