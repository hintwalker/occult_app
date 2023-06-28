part of lasotuvi_provider;

final syncNotesProvider = Provider.autoDispose<SyncNotes>(
  (ref) => SyncNotes(ref.read(noteRepositoryProvider)),
);
