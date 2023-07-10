import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:lasotuvi_data/src/db/table_names.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart' show columnId;

class SqlTemplates {
  static const tableCharts =
      kDebugMode ? TableNames.chartsTest : TableNames.charts;
  static const tableTags = kDebugMode ? TableNames.tagsTest : TableNames.tags;
  static const tableNotes =
      kDebugMode ? TableNames.notesTest : TableNames.notes;
  static const tableChartTags =
      kDebugMode ? TableNames.chartTagsTest : TableNames.chartTags;

  static String turnOnForeignKey = 'PRAGMA foreign_keys = ON;';
  static String dropTable(String name) => 'DROP TABLE IF EXISTS $name';
  static String dropTableChart() => dropTable(tableCharts);
  static String createTableChart() => '''CREATE TABLE $tableCharts(
        $columnId INTEGER PRIMARY KEY, 
        ${ColumnChart.name} TEXT, 
        ${ColumnChart.gender} INTEGER, 
        ${ColumnChart.birthday} INTEGER, 
        ${ColumnChart.watchingYear} INTEGER, 
        ${ColumnChart.timeZoneOffset} INTEGER, 
        ${ColumnChart.lastViewed} INTEGER, 
        ${ColumnChart.avatar} TEXT
        )''';
  static String createIndexNameOnChart() => '''
CREATE INDEX idx_name_chart ON $tableCharts (${ColumnChart.name})
''';

  static String createIndexLastViewedOnChart() => '''
CREATE INDEX idx_last_viewed_chart ON $tableCharts (${ColumnChart.lastViewed})
''';

  static String dropTableTag() => dropTable(tableTags);
  static String createTableTag() =>
      '''CREATE TABLE $tableTags($columnId INTEGER PRIMARY KEY, 
        ${ColumnTag.title} TEXT, 
        ${ColumnTag.description} TEXT 
        )''';
  static String dropTableChartTag() => dropTable(tableChartTags);
  static String createTableChartTag() =>
      '''CREATE TABLE $tableChartTags($columnId INTEGER PRIMARY KEY, 
        ${ColumnChartTag.tagId} INTEGER NOT NULL, 
        ${ColumnChartTag.chartId} INTEGER NOT NULL,
        FOREIGN KEY (${ColumnChartTag.tagId}) REFERENCES $tableTags($columnId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        FOREIGN KEY (${ColumnChartTag.chartId}) REFERENCES $tableCharts($columnId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        UNIQUE (${ColumnChartTag.tagId},${ColumnChartTag.chartId}) ON CONFLICT REPLACE
        )''';
  static String createIndexOnChartTag() =>
      '''CREATE INDEX idx_chart_tag ON $tableChartTags (${ColumnChartTag.chartId},${ColumnChartTag.tagId})''';

  static String dropTableNote() => dropTable(tableNotes);
  static String createTableNote() =>
      '''CREATE TABLE $tableNotes($columnId INTEGER PRIMARY KEY, 
        ${ColumnNote.title} TEXT, 
        ${ColumnNote.content} INTEGER, 
        ${ColumnNote.edited} INTEGER, 
        ${ColumnNote.chartId} INTEGER,
        FOREIGN KEY (${ColumnNote.chartId}) REFERENCES $tableCharts($columnId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        )''';
}
