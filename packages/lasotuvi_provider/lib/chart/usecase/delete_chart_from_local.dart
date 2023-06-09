part of lasotuvi_provider;

final deleteChartFromLocalProvider = Provider.autoDispose<DeleteChartFromLocal>(
  (ref) => DeleteChartFromLocal(ref.read(localChartRepositoryProvider)),
);
