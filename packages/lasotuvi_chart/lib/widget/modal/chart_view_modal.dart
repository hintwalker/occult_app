part of lasotuvi_chart;

class ChartViewModal extends StatelessWidget {
  const ChartViewModal({
    super.key,
    this.uid,
    required this.chart,
    required this.colorScheme,
    required this.controller,
    required this.translate,
    required this.onGoToDetail,
    required this.chartSyncOptions,
    required this.noteSyncOptions,
    required this.tagSyncOptions,
    required this.onOpenCheckboxTagList,
    required this.onOpenChartEditOptions,
    required this.onOpenNoteCreation,
    required this.onOpenNoteEditor,
  });
  final String? uid;
  final ColorScheme colorScheme;
  final Chart chart;
  final ChartViewController controller;
  final String Function(String) translate;
  final void Function(BuildContext context, Chart chart) onGoToDetail;
  final Widget Function(Chart, {String? uid, String? syncStatus})
      chartSyncOptions;
  final Widget Function(Note, {String? uid, String? syncStatus})
      noteSyncOptions;
  final Widget Function(Tag, {String? uid, String? syncStatus}) tagSyncOptions;
  final void Function(BuildContext context, Chart chart) onOpenCheckboxTagList;
  final void Function(BuildContext context, Chart chart) onOpenChartEditOptions;
  final void Function(BuildContext context, Chart chart) onOpenNoteCreation;
  final void Function(BuildContext context, Note note) onOpenNoteEditor;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
      title: chart.name,
      colorScheme: colorScheme,
      child: ChartViewBuilder(
        uid: uid,
        controller: controller,
        chartId: chart.docId,
        colorScheme: colorScheme,
        translate: translate,
        onGoToDetail: onGoToDetail,
        chartSyncOptions: chartSyncOptions,
        noteSyncOptions: noteSyncOptions,
        tagSyncOptions: tagSyncOptions,
        onOpenChartEditOptions: onOpenChartEditOptions,
        onOpenCheckboxTagList: onOpenCheckboxTagList,
        onOpenNoteCreation: onOpenNoteCreation,
        onOpenNoteEditor: onOpenNoteEditor,
      ),
    );
  }
}
