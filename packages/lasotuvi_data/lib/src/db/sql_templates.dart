import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:lasotuvi_data/src/db/table_names.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart'
    show columnId, columnModified, columnPaid, columnPrice;

class SqlTemplates {
  static const tableChart =
      kDebugMode ? TableNames.chartTest : TableNames.chart;
  static const tableTag = kDebugMode ? TableNames.tagTest : TableNames.tag;
  static const tableNote = kDebugMode ? TableNames.noteTest : TableNames.note;
  static const tableChartTag =
      kDebugMode ? TableNames.chartTagTest : TableNames.chartTag;
  static const tableCommentary =
      kDebugMode ? TableNames.commentaryTest : TableNames.commentary;
  static const tableRequest =
      kDebugMode ? TableNames.requestTest : TableNames.request;
  static const tableNotification =
      kDebugMode ? TableNames.notificationTest : TableNames.notification;

  static String turnOnForeignKey = 'PRAGMA foreign_keys = ON;';
  static String dropTable(String name) => 'DROP TABLE IF EXISTS $name';

  // Chart

  static String dropTableChart() => dropTable(tableChart);
  static String createTableChart() => '''CREATE TABLE $tableChart(
        $columnId INTEGER PRIMARY KEY, 
        ${ColumnChart.name} TEXT, 
        ${ColumnChart.gender} INTEGER, 
        ${ColumnChart.birthday} INTEGER, 
        ${ColumnChart.watchingYear} INTEGER, 
        ${ColumnChart.timeZoneOffset} INTEGER, 
        ${ColumnChart.lastViewed} INTEGER, 
        ${ColumnChart.avatar} TEXT,
        $columnModified INTEGER
        )''';
  static String createIndexNameOnChart() => '''
CREATE INDEX idx_name_chart ON $tableChart (${ColumnChart.name})
''';

  static String createIndexLastViewedOnChart() => '''
CREATE INDEX idx_last_viewed_chart ON $tableChart (${ColumnChart.lastViewed})
''';

// Tag

  static String dropTableTag() => dropTable(tableTag);
  static String createTableTag() =>
      '''CREATE TABLE $tableTag($columnId INTEGER PRIMARY KEY, 
        ${ColumnTag.title} TEXT, 
        ${ColumnTag.description} TEXT ,
        $columnModified INTEGER
        )''';
  static String createIndexTitleOnTag() => '''
CREATE INDEX idx_title_tag ON $tableTag (${ColumnTag.title})
''';

// ChartTag
  static String dropTableChartTag() => dropTable(tableChartTag);
  static String createTableChartTag() =>
      '''CREATE TABLE $tableChartTag($columnId INTEGER PRIMARY KEY, 
        ${ColumnChartTag.tagId} INTEGER NOT NULL, 
        ${ColumnChartTag.chartId} INTEGER NOT NULL,
        $columnModified INTEGER,
        FOREIGN KEY (${ColumnChartTag.tagId}) REFERENCES $tableTag($columnId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        FOREIGN KEY (${ColumnChartTag.chartId}) REFERENCES $tableChart($columnId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        UNIQUE (${ColumnChartTag.tagId},${ColumnChartTag.chartId}) ON CONFLICT REPLACE
        )''';
  static String createIndexOnChartTag() =>
      '''CREATE INDEX idx_chart_tag ON $tableChartTag (${ColumnChartTag.chartId},${ColumnChartTag.tagId})''';

  static String dropTableNote() => dropTable(tableNote);
  static String createTableNote() =>
      '''CREATE TABLE $tableNote($columnId INTEGER PRIMARY KEY, 
        ${ColumnNote.title} TEXT, 
        ${ColumnNote.content} TEXT, 
        ${ColumnNote.edited} INTEGER, 
        ${ColumnNote.chartId} INTEGER,
        $columnModified INTEGER,
        FOREIGN KEY (${ColumnNote.chartId}) REFERENCES $tableChart($columnId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        )''';

  static String dropTableCommentary() => dropTable(tableCommentary);
  static String createTableCommentary() =>
      '''CREATE TABLE $tableCommentary($columnId INTEGER PRIMARY KEY, 
        ${ColumnCommentary.title} TEXT, 
        ${ColumnCommentary.content} TEXT,
        ${ColumnCommentary.requestId} INTEGER,
        ${ColumnCommentary.lastViewed} INTEGER,
        $columnPrice INTEGER, 
        $columnPaid INTEGER,
        $columnModified INTEGER,
        FOREIGN KEY (${ColumnCommentary.requestId}) REFERENCES $tableRequest($columnId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        )''';

  // Request
  static String dropTableRequest() => dropTable(tableRequest);
  static String createTableRequest() => '''CREATE TABLE $tableRequest(
        $columnId INTEGER PRIMARY KEY, 
        ${ColumnRequest.name} TEXT, 
        ${ColumnRequest.gender} INTEGER, 
        ${ColumnRequest.birthday} INTEGER, 
        ${ColumnRequest.watchingYear} INTEGER, 
        ${ColumnRequest.timeZoneOffset} INTEGER, 
        ${ColumnRequest.lastViewed} INTEGER, 
        ${ColumnRequest.avatar} TEXT,
        ${ColumnRequest.solved} INTEGER,
        ${ColumnRequest.chartId} INTEGER,
        $columnModified INTEGER
        )''';
  static String createIndexNameOnRequest() => '''
CREATE INDEX idx_name_request ON $tableRequest (${ColumnRequest.name})
''';

  static String createIndexLastViewedOnRequest() => '''
CREATE INDEX idx_last_viewed_request ON $tableRequest (${ColumnRequest.lastViewed})
''';

// Notification

  static String dropTableNotification() => dropTable(tableNotification);
  static String createTableNotification() => '''CREATE TABLE $tableNotification(
        $columnId INTEGER PRIMARY KEY, 
        ${ColumnNotification.title} TEXT, 
        ${ColumnNotification.content} TEXT, 
        ${ColumnNotification.type} TEXT, 
        ${ColumnNotification.url} INTEGER, 
        ${ColumnNotification.seen} INTEGER,
        $columnModified INTEGER
        )''';
}
