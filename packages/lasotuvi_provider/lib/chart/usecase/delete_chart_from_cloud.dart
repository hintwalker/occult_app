part of lasotuvi_provider;

final deleteChartFromCloudProvider = Provider.autoDispose<DeleteChartFromCloud>(
  (ref) => DeleteChartFromCloud(ref.read(cloudChartRepositoryProvider)),
);
