part of lasotuvi_provider;

final noteDaoProvider = Provider.autoDispose<NoteDao>(
    (ref) => NoteDao(ref.read(localDatabaseProvider)));
