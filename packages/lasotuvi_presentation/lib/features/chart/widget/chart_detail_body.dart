part of lasotuvi_presentation;

class ChartDetailBody extends ConsumerStatefulWidget {
  const ChartDetailBody({
    super.key,
    required this.chartId,
  });
  final String chartId;

  @override
  ConsumerState<ChartDetailBody> createState() => _ChartDetailBodyState();
}

class _ChartDetailBodyState extends AuthDependedState<ChartDetailBody> {
  @override
  Widget build(BuildContext context) {
    return ChartDetailBuilder(
        chartId: widget.chartId,
        translate: translate,
        colorScheme: lightColorScheme,
        controller: ref.watch(chartDetailControllerProvider));
  }
}
