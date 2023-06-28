part of tuvi_chart_diagram;

class MajorStarItem extends StatelessWidget {
  const MajorStarItem(
    this.data, {
    super.key,
    this.autoSizeGroup,
    required this.translate,
  });
  final Star data;
  final AutoSizeGroup? autoSizeGroup;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    final dh = data.info.brightness[data.position.toInt()];
    final dhDisplay = dh == null ? '' : '(${dh.short})';
    return AutoSizeText(
      '${translate(data.name.name)}$dhDisplay',
      style: TextStyle(
          height: 1,
          fontWeight: FontWeight.bold,
          // fontFamily: 'PlayfairDisplay',
          // package: 'tuvi_chart_diagra',
          color: ElementColors.ofNguHanh(data.info.nguHanh.nguHanh),
          fontSize: 12),
      group: autoSizeGroup,
      minFontSize: 9,
      maxFontSize: 11,
      maxLines: 1,
      // overflow: TextOverflow.fade,
    );
  }
}
