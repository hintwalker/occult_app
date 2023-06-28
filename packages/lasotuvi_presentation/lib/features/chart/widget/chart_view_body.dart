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
    return findingUid
        ? const LoadingWidget()
        : ChartViewModal(
            uid: uid,
            chart: widget.chart,
            colorScheme: lightColorScheme,
            controller: ref.read(chartViewControllerProvider),
            translate: translate,
            onGoToDetail: (context, chart) {
              context.pushNamed(RouteName.chartDetail, pathParameters: {
                RouterParams.chartId: chart.docId,
              });
            },
            chartSyncOptions: (item, {syncStatus, uid}) =>
                StorageHelper.storageOptionsModalBuilder<Chart>(item,
                    uid: uid, syncStatus: syncStatus, ref: ref),
            noteSyncOptions: (item, {syncStatus, uid}) =>
                StorageHelper.storageOptionsModalBuilder<Note>(item,
                    uid: uid, syncStatus: syncStatus, ref: ref),
            tagSyncOptions: (item, {syncStatus, uid}) =>
                StorageHelper.storageOptionsModalBuilder<Tag>(item,
                    uid: uid, syncStatus: syncStatus, ref: ref),
          );
  }

  @override
  void dispose() {
    // ref.read(chartViewControllerProvider).dispose();
    super.dispose();
  }
}
