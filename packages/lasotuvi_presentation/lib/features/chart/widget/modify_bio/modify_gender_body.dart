part of lasotuvi_presentation;

class ModifyGenderBody extends ConsumerStatefulWidget {
  const ModifyGenderBody({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  final int chartId;
  final String? syncStatus;

  @override
  ConsumerState<ModifyGenderBody> createState() => _ModifyGenderBodyState();
}

class _ModifyGenderBodyState extends AuthDependedState<ModifyGenderBody> {
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
            child: (chart) => ModifyGenderModal(
              title: translate('modifyGender'),
              child: ModifyGenderWidget(
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

  Future<void> updateChart(Chart chart) async {
    await ref.read(updateChartProvider).call(uid, chart);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
      }
    });
  }
}
