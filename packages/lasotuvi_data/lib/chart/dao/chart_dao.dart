part of lasotuvi_data;

class ChartDao extends SqliteDao {
  ChartDao(LocalDatabase<Database> database)
      : super(
            database: database,
            tableName: kDebugMode ? TableNames.chartsTest : TableNames.charts);
}
