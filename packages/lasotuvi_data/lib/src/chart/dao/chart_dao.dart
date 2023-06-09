import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:sqflite/sqflite.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_sqflite/tauari_sqflite.dart';

import '../../db/table_names.dart';

class ChartDao extends SqliteDao {
  ChartDao(LocalDatabase<Database> database)
      : super(
            database: database,
            tableName: kDebugMode ? TableNames.chartsTest : TableNames.charts);
}
