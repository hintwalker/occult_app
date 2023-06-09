part of lasotuvi_provider;

final downloadChartProvider = Provider.autoDispose<DownloadChart>(
  (ref) => DownloadChart(ref.read(chartRepositoryProvider)),
);
