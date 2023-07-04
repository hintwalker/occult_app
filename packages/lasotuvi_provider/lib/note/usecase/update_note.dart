part of lasotuvi_provider;

final updateNoteProvider = Provider.autoDispose<UpdateNote>(
  (ref) => UpdateNote(
    ref.read(noteRepositoryProvider),
  ),
);
