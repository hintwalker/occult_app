part of tuvi_chart_diagram;

class HouseHeaderSection extends StatelessWidget {
  const HouseHeaderSection({
    super.key,
    required this.isThan,
    required this.houseName,
    required this.decade,
    required this.can,
    required this.position,
    required this.translate,
    required this.colorScheme,
    this.sizeGroup,
  });
  final bool isThan;
  final HouseName houseName;
  final Can can;
  final HousePosition position;
  final int decade;
  final AutoSizeGroup? sizeGroup;
  final String Function(String) translate;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0, left: 1.0, right: 1.0),
      child: Row(
        children: [
          HouseCanChi(
            can: can,
            chi: position.chi,
            sizeGroup: sizeGroup,
            translate: translate,
          ),
          const SizedBox(
            width: 2,
          ),
          Expanded(
              child: HouseNameView(
            translate(houseName.name),
          )),
          HouseThanView(
            isThan,
            translate: translate,
            colorScheme: colorScheme,
          ),
          const SizedBox(
            width: 1,
          ),
          HouseDecadeView(decade, translate: translate),
        ],
      ),
    );
  }
}
