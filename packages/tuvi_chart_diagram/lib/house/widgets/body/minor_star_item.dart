part of tuvi_chart_diagram;

class MinorStarItem extends StatelessWidget {
  const MinorStarItem(
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
    final dhDisplay = dh == null
        ? ''
        : dh.short == '-'
            ? ''
            : '(${dh.short})';
    // return Text(
    //   '${translate(data.name.name)}$dhDisplay',
    //   style: TextStyle(
    //     height: 1,
    //     color: ElementColors.ofNguHanh(data.info.nguHanh.nguHanh),
    //     fontWeight: data.info.bold ? FontWeight.w800 : FontWeight.w400,
    //     fontFamily: 'Oswald',
    //     package: 'tuvi_chart_diagram',
    //     fontSize: 9,
    //   ),
    //   // autoSizeGroup: autoSizeGroup,
    //   // maxFontSize: 9,
    //   // minFontSize: 7,
    //   maxLines: 1,
    //   overflow: TextOverflow.visible,
    // );
    return AutoSizeText(
      '${translate(data.name.name)}$dhDisplay',
      style: TextStyle(
          height: 1.1,
          color: ElementColors.ofNguHanh(data.info.nguHanh.nguHanh),
          fontWeight: data.info.bold ? FontWeight.w600 : FontWeight.w400,
          fontFamily: 'Oswald',
          package: 'tuvi_chart_diagram',
          wordSpacing: -1),
      // autoSizeGroup: autoSizeGroup,
      maxFontSize: 10,
      minFontSize: 7,
      maxLines: 1,
      // overflow: TextOverflow.fade,
    );
  }
}
