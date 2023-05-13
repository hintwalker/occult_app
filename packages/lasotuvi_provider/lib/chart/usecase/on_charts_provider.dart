part of lasotuvi_provider;

final onChartsProvider = Provider.autoDispose<OnCharts>(
    (ref) => OnCharts(ref.read(chartRepositoryProvider)));
