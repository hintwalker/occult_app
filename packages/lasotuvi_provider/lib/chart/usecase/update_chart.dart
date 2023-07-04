part of lasotuvi_provider;

final updateChartProvider = Provider.autoDispose<UpdateChart>(
  (ref) => UpdateChart(
    ref.read(chartRepositoryProvider),
  ),
);
