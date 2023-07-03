part of lasotuvi_presentation;

class ChartDetailBody extends ConsumerStatefulWidget {
  const ChartDetailBody({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  final String chartId;
  final String syncStatus;

  @override
  ConsumerState<ChartDetailBody> createState() => _ChartDetailBodyState();
}

class _ChartDetailBodyState extends AuthDependedState<ChartDetailBody> {
  @override
  Widget build(BuildContext context) {
    return ChartDetailBuilder(
      uid: uid,
      chartId: widget.chartId,
      syncStatus: RouterParams.getPathParamValue(widget.syncStatus),
      controller: ref.watch(chartDetailControllerProvider),
      child: (chart) => ChartDetailWidget(
        chart,
        translate: translate,
        colorScheme: lightColorScheme,
      ),
    );
  }
}
