part of tuvi_chart_diagram;

class HumanName extends StatelessWidget {
  const HumanName(this.name, {super.key});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: itemTextStyle.copyWith(fontWeight: FontWeight.w500, fontSize: 12),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
