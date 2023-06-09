part of lasotuvi_provider;

final sqliteChartTagDataSourceProvider =
    Provider.autoDispose<SqliteChartTagDataSource>(
  (ref) => SqliteChartTagDataSource(ref.read(chartTagDaoProvider)),
);
