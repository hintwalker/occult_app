import 'package:lasotuvi_data/src/db/sql_templates.dart';
import 'package:sqflite/sqflite.dart';

Future<void> onDbConfigure(Database db) async {
  await db.execute(SqlTemplates.turnOnForeignKey);
}
