import 'package:lasotuvi_data/src/db/table_names.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart'
    show columnId, columnModified, columnPaid, columnPrice, columnUploadDate;

class SqlTemplates {
  // static const TableNames.chart =
  //     kDebugMode ? TableNames.chartTest : TableNames.chart;
  // static const TableNames.tag = kDebugMode ? TableNames.tagTest : TableNames.tag;
  // static const TableNames.note = kDebugMode ? TableNames.noteTest : TableNames.note;
  // static const TableNames.chartTag =
  //     kDebugMode ? TableNames.chartTagTest : TableNames.chartTag;
  // static const TableNames.commentary =
  //     kDebugMode ? TableNames.commentaryTest : TableNames.commentary;
  // static const TableNames.request =
  //     kDebugMode ? TableNames.requestTest : TableNames.request;
  // static const TableNames.notification =
  //     kDebugMode ? TableNames.notificationTest : TableNames.notification;

  static String turnOnForeignKey = 'PRAGMA foreign_keys = ON;';
  static String dropTable(String name) => 'DROP TABLE IF EXISTS $name';

  // Chart

  static String dropTableChart() => dropTable(TableNames.chart);
  static String createTableChart() => '''CREATE TABLE ${TableNames.chart}(
        $columnId INTEGER PRIMARY KEY, 
        ${ColumnChart.name} TEXT, 
        ${ColumnChart.gender} INTEGER, 
        ${ColumnChart.birthday} INTEGER, 
        ${ColumnChart.watchingYear} INTEGER, 
        ${ColumnChart.timeZoneOffset} INTEGER, 
        ${ColumnChart.lastViewed} INTEGER, 
        ${ColumnChart.avatar} TEXT,
        $columnModified INTEGER,
        $columnUploadDate INTEGER
        )''';
  static String createIndexNameOnChart() => '''
CREATE INDEX idx_name_chart ON ${TableNames.chart} (${ColumnChart.name})
''';

  static String createIndexLastViewedOnChart() => '''
CREATE INDEX idx_last_viewed_chart ON ${TableNames.chart} (${ColumnChart.lastViewed})
''';

// Tag

  static String dropTableTag() => dropTable(TableNames.tag);
  static String createTableTag() =>
      '''CREATE TABLE ${TableNames.tag}($columnId INTEGER PRIMARY KEY, 
        ${ColumnTag.title} TEXT, 
        ${ColumnTag.description} TEXT ,
        $columnModified INTEGER,
        $columnUploadDate INTEGER
        )''';
  static String createIndexTitleOnTag() => '''
CREATE INDEX idx_title_tag ON ${TableNames.tag} (${ColumnTag.title})
''';

// ChartTag
  static String dropTableChartTag() => dropTable(TableNames.chartTag);
  static String createTableChartTag() =>
      '''CREATE TABLE ${TableNames.chartTag}($columnId INTEGER PRIMARY KEY, 
        ${ColumnChartTag.tagId} INTEGER NOT NULL, 
        ${ColumnChartTag.chartId} INTEGER NOT NULL,
        $columnModified INTEGER,
        $columnUploadDate INTEGER,
        FOREIGN KEY (${ColumnChartTag.tagId}) REFERENCES ${TableNames.tag}($columnId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        FOREIGN KEY (${ColumnChartTag.chartId}) REFERENCES ${TableNames.chart}($columnId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        UNIQUE (${ColumnChartTag.tagId},${ColumnChartTag.chartId}) ON CONFLICT REPLACE
        )''';
  static String createIndexOnChartTag() =>
      '''CREATE INDEX idx_chart_tag ON ${TableNames.chartTag} (${ColumnChartTag.chartId},${ColumnChartTag.tagId})''';

  static String dropTableNote() => dropTable(TableNames.note);
  static String createTableNote() =>
      '''CREATE TABLE ${TableNames.note}($columnId INTEGER PRIMARY KEY, 
        ${ColumnNote.title} TEXT, 
        ${ColumnNote.content} TEXT, 
        ${ColumnNote.edited} INTEGER, 
        ${ColumnNote.chartId} INTEGER,
        $columnModified INTEGER,
        $columnUploadDate INTEGER,
        FOREIGN KEY (${ColumnNote.chartId}) REFERENCES ${TableNames.chart}($columnId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        )''';

  static String dropTableCommentary() => dropTable(TableNames.commentary);
  static String createTableCommentary() =>
      '''CREATE TABLE ${TableNames.commentary}($columnId INTEGER PRIMARY KEY, 
        ${ColumnCommentary.title} TEXT, 
        ${ColumnCommentary.content} TEXT,
        ${ColumnCommentary.requestId} INTEGER,
        ${ColumnCommentary.lastViewed} INTEGER,
        $columnPrice INTEGER, 
        $columnPaid INTEGER,
        $columnModified INTEGER,
        $columnUploadDate INTEGER,
        FOREIGN KEY (${ColumnCommentary.requestId}) REFERENCES ${TableNames.request}($columnId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
        )''';

  // Request
  static String dropTableRequest() => dropTable(TableNames.request);
  static String createTableRequest() => '''CREATE TABLE ${TableNames.request}(
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
        $columnModified INTEGER,
        $columnUploadDate INTEGER
        )''';
  static String createIndexNameOnRequest() => '''
CREATE INDEX idx_name_request ON ${TableNames.request} (${ColumnRequest.name})
''';

  static String createIndexLastViewedOnRequest() => '''
CREATE INDEX idx_last_viewed_request ON ${TableNames.request} (${ColumnRequest.lastViewed})
''';

// Notification

  static String dropTableNotification() => dropTable(TableNames.notification);
  static String createTableNotification() =>
      '''CREATE TABLE ${TableNames.notification}(
        $columnId INTEGER PRIMARY KEY, 
        ${ColumnNotification.title} TEXT, 
        ${ColumnNotification.content} TEXT, 
        ${ColumnNotification.type} TEXT, 
        ${ColumnNotification.url} INTEGER, 
        ${ColumnNotification.seen} INTEGER,
        $columnModified INTEGER,
        $columnUploadDate INTEGER
        )''';

  static String addColumnUploadDate(String table) => '''
ALTER TABLE $table DROP COLUMN $columnUploadDate;
ALTER TABLE $table ADD COLUMN $columnUploadDate INTEGER;''';

  static String upgrade1_2() {
    return '''${addColumnUploadDate(TableNames.chart)}
    ${addColumnUploadDate(TableNames.tag)}
    ${addColumnUploadDate(TableNames.chartTag)}
    ${addColumnUploadDate(TableNames.note)}
    ${addColumnUploadDate(TableNames.request)}
    ${addColumnUploadDate(TableNames.commentary)}
    ${addColumnUploadDate(TableNames.notification)}
    ''';
  }
}
