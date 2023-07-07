part of lasotuvi_provider;

final chartByNoteIdProvider = Provider.autoDispose<ChartByNoteId>(
  (ref) => ChartByNoteId(ref.read(noteAndChartRepositoryProvider)),
);
