part of tuvi_chart_diagram;

class HouseCanChi extends StatelessWidget {
  final Can can;
  final Chi chi;
  final AutoSizeGroup? sizeGroup;
  final String Function(String) translate;

  const HouseCanChi({
    super.key,
    required this.can,
    required this.chi,
    required this.translate,
    this.sizeGroup,
  });
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      '${can.short}.${translate(chi.name)}',
      group: sizeGroup,
      // translate: translate,
      style: const TextStyle(fontSize: 7, fontWeight: FontWeight.w600),
      minFontSize: 7,
    );
  }
}
