part of lasotuvi_presentation;

class ChartCreationBody extends ConsumerStatefulWidget {
  const ChartCreationBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChartCreationBodyState();
}

class _ChartCreationBodyState extends AuthDependedState<ChartCreationBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ChartCreationForm(
            colorScheme: lightColorScheme,
            translate: translate,
            onCreateChart: onCreateChart));
  }

  Future<void> onCreateChart(Chart chart) async {
    await ref.read(insertChartToLocalProvider)(chart);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.pop();
      ChartHelper.openChartView(context: context, chart: chart);
    });
  }
}
