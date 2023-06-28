part of tuvi_chart_diagram;

class HumanGender extends StatelessWidget {
  const HumanGender(this.data, {super.key, required this.translate});
  final DuongNamAmNu data;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return ItemContainer(
      Text(translate(data.name), style: itemTextStyle),
    );
  }
}
