part of lasotuvi_chart;

class SingleSelectableChartListModal extends StatelessWidget {
  const SingleSelectableChartListModal({
    super.key,
    required this.controller,
    required this.translate,
    required this.colorScheme,
    required this.onItemTap,
    this.uid,
  });

  final ChartListController controller;
  final String? uid;

  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext, Chart, String? uid) onItemTap;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
      title: translate('selectOnChart'),
      colorScheme: colorScheme,
      child: SingleSelectableChartListBuilder(
          controller: controller,
          translate: translate,
          colorScheme: colorScheme,
          onItemTap: onItemTap,
          uid: uid),
    );
  }
}
