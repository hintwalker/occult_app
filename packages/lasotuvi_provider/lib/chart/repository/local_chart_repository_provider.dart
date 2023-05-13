part of lasotuvi_provider;

final localChartRepositoryProvider = Provider.autoDispose<LocalChartRepository>(
  (ref) => LocalChartRepositoryImpl(ref.read(sqliteChartDataSourceProvider)),
);
