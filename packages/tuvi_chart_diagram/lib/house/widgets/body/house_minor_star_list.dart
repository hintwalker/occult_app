part of tuvi_chart_diagram;

class HouseMinorStarList extends StatelessWidget {
  const HouseMinorStarList(this.stars,
      {super.key, this.autoSizeGroup, required this.translate});
  final Iterable<Star> stars;
  final AutoSizeGroup? autoSizeGroup;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 0),
            itemCount: stars.length,
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return MinorStarItem(
                stars.elementAt(index),
                autoSizeGroup: autoSizeGroup,
                translate: translate,
              );
              // return AutoSizeText(
              //   style: TextStyle(
              //     height: 1,
              //   ),
              //   stars.elementAt(index).name.name,
              //   maxLines: 1,
              //   minFontSize: 7,
              //   group: groupFontSize,
              // );
              // return ListTile(
              //   minVerticalPadding: 0,
              //   dense: true,
              //   contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 2),
              //   title: AutoSizeText(
              //     stars.elementAt(index).name.name,
              //     maxLines: 1,
              //   ),
              // );
            }));
  }
}
