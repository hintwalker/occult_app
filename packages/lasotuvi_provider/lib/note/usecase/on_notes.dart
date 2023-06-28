part of lasotuvi_provider;

final onNotesProvider = Provider.autoDispose<OnNotes>(
  (ref) => OnNotes(ref.read(noteRepositoryProvider)),
);
