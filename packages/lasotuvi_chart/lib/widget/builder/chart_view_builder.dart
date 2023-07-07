part of lasotuvi_chart;

class ChartViewBuilder extends StatelessWidget {
  const ChartViewBuilder({
    super.key,
    required this.controller,
    required this.chart,
    required this.uid,
    required this.child,
    required this.colorScheme,
    // required this.colorScheme,
    // required this.translate,
    // required this.onGoToDetail,
    // required this.chartSyncOptions,
    // required this.noteSyncOptions,
    // required this.tagSyncOptions,
    // required this.onOpenCheckboxTagList,
    // required this.onOpenChartEditOptions,
    // required this.onOpenNoteCreation,
    // required this.onOpenNoteEditor,
  });
  final ChartViewController controller;
  final String? uid;
  final Chart chart;
  final ColorScheme colorScheme;
  final Widget Function(ChartHasTags chartHasTags) child;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChartHasTags?>(
        stream: controller.stream(uid, chart),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final chart = snapshot.requireData;
            // if (chart == null) {
            //   Navigator.pop(context);
            // }
            return chart == null
                ? const BasicDialog(title: '', children: [ErrorTextWidget()])
                : child(chart);
            // ChartViewWidget(
            //     chart,
            //     uid: uid,
            //     controller: controller,
            //     colorScheme: colorScheme,
            //     translate: translate,
            //     onGoToDetail: onGoToDetail,
            //     chartSyncOptions: chartSyncOptions,
            //     noteSyncOptions: noteSyncOptions,
            //     tagSyncOptions: tagSyncOptions,
            //     onOpenChartEditOptions: onOpenChartEditOptions,
            //     onOpenCheckboxTagList: onOpenCheckboxTagList,
            //     onOpenNoteCreation: onOpenNoteCreation,
            //     onOpenNoteEditor: onOpenNoteEditor,
            //   );
          } else {
            return BasicModal(
              title: '',
              colorScheme: colorScheme,
              child: const Center(
                child: CircularProgressIndicator(),
                // Text('chart_view_builder: else'),
              ),
            );
          }
        });
  }
  // final ColorScheme colorScheme;
  // final String Function(String) translate;
  // final void Function(BuildContext context, Chart chart) onGoToDetail;
  // final Widget Function(Chart, {String? uid, String? syncStatus})
  //     chartSyncOptions;
  // final Widget Function(Note, {String? uid, String? syncStatus})
  //     noteSyncOptions;
  // final Widget Function(Tag, {String? uid, String? syncStatus}) tagSyncOptions;
  // final void Function(BuildContext context, Chart chart) onOpenCheckboxTagList;
  // final void Function(BuildContext context, Chart chart) onOpenChartEditOptions;
  // final void Function(BuildContext context, Chart chart) onOpenNoteCreation;
  // final void Function(BuildContext context, Note note) onOpenNoteEditor;
}
