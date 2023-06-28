part of tuvi_chart_diagram;

class TuviHouseContainer extends StatefulWidget {
  const TuviHouseContainer(
    this.data, {
    super.key,
    required this.minorStarSizeGroup,
    required this.majorStarSizeGroup,
    required this.translate,
    required this.controller,
    required this.colorScheme,
    this.positionSizeGroup,
  });
  final House data;
  final AutoSizeGroup minorStarSizeGroup;
  final AutoSizeGroup majorStarSizeGroup;
  final AutoSizeGroup? positionSizeGroup;
  final String Function(String) translate;
  final HouseController controller;
  final ColorScheme colorScheme;
  @override
  State<StatefulWidget> createState() => _TuviHouseContainerState();
}

class _TuviHouseContainerState extends State<TuviHouseContainer> {
  late Color containerColor;
  void onTap() {
    widget.controller.select(true, true);
  }

  void onChangedByOutside() {
    setState(() {
      if (widget.controller.selected) {
        if (widget.controller.source) {
          containerColor = ElementColors.selectedAsSource;
        } else {
          containerColor = ElementColors.selectedAsOther;
        }
      } else {
        containerColor = widget.colorScheme.background;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    containerColor = widget.colorScheme.background;
    widget.controller.addListener(onChangedByOutside);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onChangedByOutside);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(
              color: widget.colorScheme.onBackground,
              width: 0.5,
            ),
          ),
          child: TuviHouse(
            widget.data,
            minorStarSizeGroup: widget.minorStarSizeGroup,
            majorStarSizeGroup: widget.majorStarSizeGroup,
            translate: widget.translate,
            positionSizeGroup: widget.positionSizeGroup,
            colorScheme: widget.colorScheme,
          ),
        ) //.applyConstraintId(id: widget.constraintId),
        );
  }
}
