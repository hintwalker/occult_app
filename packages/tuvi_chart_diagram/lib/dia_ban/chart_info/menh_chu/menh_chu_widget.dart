part of tuvi_chart_diagram;

class MenhChuWidget extends StatelessWidget {
  const MenhChuWidget(
    this.posOfMenh, {
    super.key,
    required this.translate,
  });
  final String Function(String) translate;
  final HousePosition posOfMenh;

  @override
  Widget build(BuildContext context) {
    final data = menhChu(posOfMenh);
    return Row(
      children: [
        HumanItemTitle('menhChu', translate: translate),
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
