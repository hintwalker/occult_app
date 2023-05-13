part of lasotuvi_data;

class ChartTagDao extends SqliteDao {
  ChartTagDao(LocalDatabase<Database> database)
      : super(
          database: database,
          tableName:
              kDebugMode ? TableNames.chartTagsTest : TableNames.chartTags,
        );
}
