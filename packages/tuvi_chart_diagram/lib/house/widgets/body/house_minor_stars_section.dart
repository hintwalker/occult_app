part of tuvi_chart_diagram;

class HouseMinorStarsSection extends StatelessWidget {
  const HouseMinorStarsSection(
      {super.key,
      required this.goodStars,
      required this.badStars,
      this.autoSizeGroup,
      required this.translate});
  final Iterable<Star> goodStars;
  final Iterable<Star> badStars;
  final AutoSizeGroup? autoSizeGroup;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: HouseMinorStarList(
          goodStars,
          autoSizeGroup: autoSizeGroup,
          translate: translate,
        ),
      ),
      Expanded(
        child: HouseMinorStarList(
          badStars,
          autoSizeGroup: autoSizeGroup,
          translate: translate,
        ),
      )
    ]);
  }
}
