part of lasotuvi_presentation;

class ModifyWatchingYearBody extends ConsumerStatefulWidget {
  const ModifyWatchingYearBody({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  final int chartId;
  final String? syncStatus;

  @override
  ConsumerState<ModifyWatchingYearBody> createState() =>
      _ModifyWatchingYearBodyState();
}

class _ModifyWatchingYearBodyState
    extends AuthDependedState<ModifyWatchingYearBody> {
  @override
  Widget build(BuildContext context) {
    final processing = ref.watch(modifyChartControllerProvider);
    return findingUid || processing
        ? const LoadingWidget()
        : ChartModificationOptionsBuilder(
            uid: uid,
            docId: widget.chartId,
            syncStatus: widget.syncStatus,
            controller: ref.read(chartDetailControllerProvider),
            child: (chart) => ModifyWatchingYearModal(
              title: translate('modifyWatchingYear'),
              child: ModifyWatchingYearWidget(
                chart: chart,
                colorScheme: LasotuviAppStyle.colorScheme,
                translate: translate,
                onUpdate: (chart) => ref
                    .read(modifyChartControllerProvider.notifier)
                    .updateChart(
                      context: context,
                      uid: uid,
                      chart: chart,
                      ref: ref,
                    ),
              ),
            ),
          );
  }
}
