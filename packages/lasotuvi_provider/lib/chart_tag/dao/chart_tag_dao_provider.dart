part of lasotuvi_provider;

final chartTagDaoProvider = Provider.autoDispose<ChartTagDao>(
  (ref) => ChartTagDao(ref.read(localDatabaseProvider)),
);
