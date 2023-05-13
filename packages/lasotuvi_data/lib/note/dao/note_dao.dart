part of lasotuvi_data;

class NoteDao extends SqliteDao {
  NoteDao(LocalDatabase<Database> database)
      : super(
            database: database,
            tableName: kDebugMode ? TableNames.notesTest : TableNames.notes);
}
