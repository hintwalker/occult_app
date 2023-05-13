part of lasotuvi_data;

class SqliteNoteDataSource extends LocalDataSource<NoteModel> {
  SqliteNoteDataSource(super.dao)
      : super(fromMap: (map) => NoteModel.fromMap(map));
}
