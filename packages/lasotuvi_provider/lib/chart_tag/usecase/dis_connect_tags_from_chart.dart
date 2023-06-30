part of lasotuvi_provider;

final disConnectTagsFromChartProvider =
    Provider.autoDispose<DisConnectTagsFromChart>(
  (ref) => DisConnectTagsFromChart(ref.read(chartTagRepositoryProvider)),
);
