part of lasotuvi_provider;

final insertChartToLocalProvider = Provider.autoDispose<InsertChartToLocal>(
  (ref) => InsertChartToLocal(ref.read(localChartRepositoryProvider)),
);
