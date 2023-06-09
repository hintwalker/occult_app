part of lasotuvi_provider;

final uploadNoteProvider = Provider.autoDispose<UploadNote>(
  (ref) => UploadNote(ref.read(noteRepositoryProvider)),
);
