import 'package:sqflite/sqflite.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_sqflite/tauari_sqflite.dart';

import '../../db/table_names.dart';

class CommentaryDao extends SqliteDao {
  CommentaryDao(LocalDatabase<Database> database)
      : super(database: database, tableName: TableNames.commentary);
}
