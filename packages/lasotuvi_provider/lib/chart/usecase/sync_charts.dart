part of lasotuvi_provider;

final syncChartsProvider = Provider.autoDispose<SyncCharts>(
  (ref) => SyncCharts(ref.read(chartRepositoryProvider)),
);
