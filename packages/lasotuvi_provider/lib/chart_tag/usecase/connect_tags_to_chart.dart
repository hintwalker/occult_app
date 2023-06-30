part of lasotuvi_provider;

final connectTagsToChartProvider = Provider.autoDispose<ConnectTagsToChart>(
  (ref) => ConnectTagsToChart(ref.read(chartTagRepositoryProvider)),
);
