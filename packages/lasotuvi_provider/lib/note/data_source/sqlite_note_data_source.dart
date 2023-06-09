part of lasotuvi_provider;

final sqliteNoteDataSourceProvider = Provider.autoDispose<SqliteNoteDataSource>(
  (ref) => SqliteNoteDataSource(ref.read(noteDaoProvider)),
);
