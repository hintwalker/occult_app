part of lasotuvi_data;

class SqliteTagDataSource extends LocalDataSource<TagModel> {
  SqliteTagDataSource(super.dao)
      : super(fromMap: (map) => TagModel.fromMap(map));
}
