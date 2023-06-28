part of tuvi_chart_diagram;

class HouseThanView extends StatelessWidget {
  const HouseThanView(
    this.visible, {
    super.key,
    required this.translate,
    required this.colorScheme,
  });
  final bool visible;
  final String Function(String) translate;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return visible
        ? BasicAutoSizeText(
            translate('than'),
            upperCase: true,
            style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w500,
                backgroundColor: colorScheme.primary,
                color: colorScheme.onPrimary),
          )
        : const SizedBox.shrink();
  }
}
