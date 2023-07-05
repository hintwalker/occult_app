part of lasotuvi_presentation;

class ChartViewBody extends ConsumerStatefulWidget {
  const ChartViewBody({
    super.key,
    required this.chart,
  });
  final Chart chart;

  @override
  ConsumerState<ChartViewBody> createState() => _ChartViewBodyState();
}

class _ChartViewBodyState extends AuthDependedState<ChartViewBody> {
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(chartViewControllerProvider);
    return findingUid
        ? const LoadingWidget()
        : ChartViewModal(
            uid: uid,
            chart: widget.chart,
            colorScheme: lightColorScheme,
            controller: controller,
            child: (chartHasTags) => ChartViewWidget(
                  chartHasTags,
                  controller: controller,
                  translate: translate,
                  colorScheme: lightColorScheme,
                  onGoToDetail: (context, chart) {
                    ChartHelper.openChartDetail(
                        context: context,
                        chartId: chart.docId,
                        syncStatus: chart.syncStatus);
                    // context.pushNamed(RouteName.chartDetail, pathParameters: {
                    //   RouterParams.chartId: chart.docId,
                    //   RouterParams.syncStatus:
                    //       chart.syncStatus ?? RouterParams.nullValue,
                    // });
                  },
                  chartSyncOptions: (item, {syncStatus, uid}) =>
                      StorageHelper.storageOptionsModalBuilder<Chart>(item,
                          uid: uid,
                          syncStatus: syncStatus,
                          ref: ref, doBeforeDeleteForever: () {
                    Navigator.popUntil(context, (route) {
                      return route.settings.name != 'chartView';
                    });
                  }),
                  noteSyncOptions: (item, {syncStatus, uid}) =>
                      StorageHelper.storageOptionsModalBuilder<Note>(item,
                          uid: uid, syncStatus: syncStatus, ref: ref),
                  tagSyncOptions: (item, {syncStatus, uid}) =>
                      StorageHelper.storageOptionsModalBuilder<Tag>(item,
                          uid: uid, syncStatus: syncStatus, ref: ref),
                  onOpenChartEditOptions: (context, chart) =>
                      ChartHelper.openChartEditOptions(context, chart),
                  onOpenCheckboxTagList: (context, chart) =>
                      TagHelper.openCheckboxTagList(context, chart),
                  onOpenNoteCreation: (context, chart) =>
                      NoteHelper.openNewNoteEditorScreen(
                          context: context, uid: uid, chart: chart, ref: ref),
                  onOpenNoteEditor: (context, note) =>
                      NoteHelper.openNoteEditorScreen(context, note),
                ));
  }

  @override
  void dispose() {
    // ref.read(chartViewControllerProvider).dispose();
    super.dispose();
  }
}
