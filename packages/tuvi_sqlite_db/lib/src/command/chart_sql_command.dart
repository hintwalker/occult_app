import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import '../command/sql_command.dart';

import '../constants/table_names.dart';

class ChartSqlCommand {
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
}
