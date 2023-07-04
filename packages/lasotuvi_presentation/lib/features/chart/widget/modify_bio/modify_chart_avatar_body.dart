part of lasotuvi_presentation;

class ModifyChartAvatarBody extends ConsumerStatefulWidget {
  const ModifyChartAvatarBody({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  // final Chart chart;
  final int chartId;
  final String? syncStatus;

  @override
  ConsumerState<ModifyChartAvatarBody> createState() =>
      _ModifyChartAvatarBodyState();
}

class _ModifyChartAvatarBodyState
    extends AuthDependedState<ModifyChartAvatarBody> {
  // Chart? chart;
  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     chart = widget.chart;
  //   });
  // }

  // @override
  // void didUpdateWidget(covariant ModifyChartAvatarBody oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   setState(() {
  //     chart = widget.chart;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final processing = ref.watch(modifyChartControllerProvider);
    return ModifyChartAvatarModal(
      title: translate('modifyAvatar'),
      child: findingUid || processing
          ? const LoadingWidget()
          : ChartModificationOptionsBuilder(
              uid: uid,
              docId: widget.chartId,
              syncStatus: widget.syncStatus,
              controller: ref.read(chartDetailControllerProvider),
              child: (chart) => ModifyChartAvatarWidget(
                chart: chart,
                translate: translate,
                onUpdate: (chart) => ref
                    .read(modifyChartControllerProvider.notifier)
                    .updateChart(
                        context: context, uid: uid, chart: chart, ref: ref),
              ),
            ),
    );
  }
}
