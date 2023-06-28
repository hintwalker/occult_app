part of lasotuvi_provider;

final insertNoteToLocalProvider = Provider.autoDispose<InsertNoteToLocal>(
  (ref) => InsertNoteToLocal(ref.read(localNoteRepositoryProvider)),
);
