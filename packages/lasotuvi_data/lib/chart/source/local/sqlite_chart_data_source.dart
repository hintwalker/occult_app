part of lasotuvi_data;

class SqliteChartDataSource extends LocalDataSource<ChartModel> {
  SqliteChartDataSource(super.dao)
      : super(fromMap: (map) => ChartModel.fromMap(map));

  // Stream<List<ChartModel>> onCharts({QueryArgs? queryArgs});
  // Stream<int?> onCountAll();
  // Future<int> countAll();

  // Future addChart(ChartModel item);

  // Future deleteFromLocal(int itemId);

  // Future<ChartModel?> chartById(int chartId);
}
