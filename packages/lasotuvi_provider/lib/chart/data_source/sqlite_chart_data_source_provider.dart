part of lasotuvi_provider;

final sqliteChartDataSourceProvider =
    Provider.autoDispose<SqliteChartDataSource>(
  (ref) => SqliteChartDataSource(ref.read(chartDaoProvider)),
);
