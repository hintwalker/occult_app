part of lasotuvi_presentation;

class ModifyBirthdayBody extends ConsumerStatefulWidget {
  const ModifyBirthdayBody({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  final int chartId;
  final String? syncStatus;

  @override
  ConsumerState<ModifyBirthdayBody> createState() => _ModifyBirthdayBodyState();
}

class _ModifyBirthdayBodyState extends AuthDependedState<ModifyBirthdayBody> {
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
            child: (chart) => ModifyBirthdayModal(
              title: translate('modifyBirthday'),
              child: ModifyBirthdayWidget(
                chart,
                colorScheme: LasotuviAppStyle.colorScheme,
                translate: translate,
                onUpdate: (chart) => ref
                    .read(modifyChartControllerProvider.notifier)
                    .updateChart(
                        context: context, uid: uid, chart: chart, ref: ref),
              ),
            ),
          );
  }

  // Future<void> updateBirthday(Chart chart) async {
  //   await ref.read(updateChartProvider)(uid, chart);
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     if (context.mounted) {
  //       context.pop();
  //     }
  //   });
  // }
}
