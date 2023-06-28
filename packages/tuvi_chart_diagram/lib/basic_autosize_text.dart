part of tuvi_chart_diagram;

class BasicAutoSizeText extends StatelessWidget {
  const BasicAutoSizeText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines = 1,
    this.minFontSize = 7,
    this.maxFontSize = 24,
    this.autoSizeGroup,
    this.overflow = TextOverflow.ellipsis,
    this.upperCase = false,
  });

  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int maxLines;
  final double minFontSize;
  final double maxFontSize;
  final AutoSizeGroup? autoSizeGroup;
  final TextOverflow overflow;
  final bool upperCase;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      upperCase ? data.toUpperCase() : data,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      minFontSize: minFontSize,
      maxFontSize: maxFontSize,
      group: autoSizeGroup,
      overflow: overflow,
    );
  }
}
