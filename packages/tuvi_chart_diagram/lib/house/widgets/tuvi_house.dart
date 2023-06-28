part of tuvi_chart_diagram;

class TuviHouse extends StatelessWidget {
  const TuviHouse(
    this.data, {
    super.key,
    this.minorStarSizeGroup,
    this.majorStarSizeGroup,
    this.positionSizeGroup,
    required this.translate,
    required this.colorScheme,
  });
  final House data;
  final AutoSizeGroup? minorStarSizeGroup;
  final AutoSizeGroup? majorStarSizeGroup;
  final AutoSizeGroup? positionSizeGroup;
  final String Function(String) translate;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HouseHeaderSection(
          isThan: data.isThan,
          houseName: data.name,
          decade: data.lifeMilestone.decade,
          can: data.can!,
          position: data.position,
          sizeGroup: positionSizeGroup,
          translate: translate,
          colorScheme: colorScheme,
        ),
        Expanded(
            child: HouseBodySection(
          majorStars: data.majorStars,
          minorStars: data.minorStars,
          minorStarSizeGroup: minorStarSizeGroup,
          majorStarSizeGroup: majorStarSizeGroup,
          translate: translate,
        )),
        HouseBottomSection(
          year: data.lifeMilestone.year,
          month: data.lifeMilestone.month,
          lifeStar: data.lifeStar!,
          translate: translate,
        )
      ],
    );
  }
}
