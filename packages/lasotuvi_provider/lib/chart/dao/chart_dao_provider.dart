part of lasotuvi_provider;

final chartDaoProvider = Provider.autoDispose<ChartDao>(
  (ref) => ChartDao(ref.read(localDatabaseProvider)),
);
