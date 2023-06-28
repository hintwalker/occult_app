part of lasotuvi_provider;

final onNoteAndChartProvider = Provider.autoDispose<OnNoteAndChart>(
  (ref) => OnNoteAndChart(repository: ref.read(noteAndChartRepositoryProvider)),
);
