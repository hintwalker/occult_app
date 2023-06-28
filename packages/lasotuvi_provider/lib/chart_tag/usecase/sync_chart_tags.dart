part of lasotuvi_provider;

final syncChartTagsProvider = Provider.autoDispose<SyncChartTags>(
  (ref) => SyncChartTags(ref.read(chartTagRepositoryProvider)),
);
