part of lasotuvi_chart;

class CheckboxChartListModal extends StatelessWidget {
  const CheckboxChartListModal({
    super.key,
    required this.tagId,
    required this.controller,
    required this.translate,
    required this.colorScheme,
    required this.onCancel,
    required this.onSubmit,
    required this.onItemTap,
    this.uid,
  });

  final ChartHasTagsListController controller;
  final String? uid;
  final int tagId;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext context) onCancel;
  final void Function(BuildContext context,
      Iterable<SelectableItem<ChartHasTags>> charts, String? uid) onSubmit;
  final void Function(BuildContext context, Chart chart, String? uid) onItemTap;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
      title: translate('selectOnChart'),
      colorScheme: colorScheme,
      child: CheckboxChartListBuilder(
        uid: uid,
        tagId: tagId,
        controller: controller,
        translate: translate,
        colorScheme: colorScheme,
        onCancel: onCancel,
        onSubmit: onSubmit,
        onItemTap: onItemTap,
      ),
    );
  }
}
