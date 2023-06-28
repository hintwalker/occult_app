part of lasotuvi_provider;

final onChartProvider = Provider.autoDispose<OnChart>(
    (ref) => OnChart(ref.read(chartRepositoryProvider)));
