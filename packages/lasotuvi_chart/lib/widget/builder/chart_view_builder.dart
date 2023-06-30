part of lasotuvi_chart;

class ChartViewBuilder extends StatelessWidget {
  const ChartViewBuilder({
    super.key,
    required this.controller,
    required this.chartId,
    this.uid,
    required this.colorScheme,
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
  final ChartViewController controller;
  final String? uid;
  final String chartId;
  final ColorScheme colorScheme;
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
  // final Widget Function(Note, {String? uid, String? syncStatus})
  //     noteSyncOptions;

  @override
  Widget build(BuildContext context) {
    final docId = int.tryParse(chartId);
    return docId == null
        ? const ErrorTextWidget()
        : StreamBuilder<ChartHasTags?>(
            stream: controller.stream(
              uid,
              docId,
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else if (snapshot.hasData) {
                final chart = snapshot.requireData;
                return chart == null
                    ? const ErrorTextWidget()
                    : ChartViewWidget(
                        chart,
                        uid: uid,
                        controller: controller,
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
                      );
              } else {
                return const ErrorTextWidget();
              }
            });
  }
}
