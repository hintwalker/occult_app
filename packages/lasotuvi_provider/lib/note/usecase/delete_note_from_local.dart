part of lasotuvi_provider;

final deleteNoteFromLocalProvider = Provider.autoDispose<DeleteNoteFromLocal>(
  (ref) => DeleteNoteFromLocal(ref.read(localNoteRepositoryProvider)),
);
