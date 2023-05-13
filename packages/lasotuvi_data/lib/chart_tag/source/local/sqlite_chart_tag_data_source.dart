part of lasotuvi_data;

class SqliteChartTagDataSource extends LocalDataSource<ChartTagModel> {
  SqliteChartTagDataSource(super.dao)
      : super(fromMap: (map) => ChartTagModel.fromMap(map));
}
