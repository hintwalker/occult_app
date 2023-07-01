part of lasotuvi_provider;

final onNoteByIdProvider = Provider.autoDispose<OnNoteById>(
  (ref) => OnNoteById(ref.read(noteRepositoryProvider)),
);
