part of lasotuvi_provider;

final downloadNoteProvider = Provider.autoDispose<DownloadNote>(
  (ref) => DownloadNote(ref.read(noteRepositoryProvider)),
);
