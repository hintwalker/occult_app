part of lasotuvi_data;

class TagDao extends SqliteDao {
  TagDao(LocalDatabase<Database> database)
      : super(
            database: database,
            tableName: kDebugMode ? TableNames.tagsTest : TableNames.tags);

  // Future<int> insertCharts(Iterable<Map<String, Object?>> map) async {
  //   for (var item in map) {
  //     await database.db!.insert(tableChartTag, item);
  //   }
  //   database.triggerUpdate();
  //   return map.length;
  // }

  // Future<int> removeCharts(int tagId, Iterable<int> chartIds) async {
  //   for (var chartId in chartIds) {
  //     await database.db!.delete(
  //       tableChartTag,
  //       where: '${ColumnChartTag.chartId} = ? AND ${ColumnChartTag.tagId} = ?',
  //       whereArgs: [chartId, tagId],
  //     );
  //   }
  //   database.triggerUpdate();
  //   return chartIds.length;
  // }
}
