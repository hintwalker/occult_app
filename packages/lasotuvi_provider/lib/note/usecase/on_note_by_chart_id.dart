part of lasotuvi_provider;

final onNoteByChartIdProvider = Provider.autoDispose<OnNoteByChartId>(
  (ref) => OnNoteByChartId(ref.read(noteAndChartRepositoryProvider)),
);
