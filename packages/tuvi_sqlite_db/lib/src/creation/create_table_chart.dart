import 'package:sqflite/sqflite.dart';
import 'package:tuvi_sqlite_db/src/command/chart_sql_command.dart';

Future<void> createTableChart(Database db) async {
  await db.execute(ChartSqlCommand.dropTableChart());
  await db.execute(ChartSqlCommand.createTableChart());
  await db.execute(ChartSqlCommand.createIndexNameOnChart());
  await db.execute(ChartSqlCommand.createIndexLastViewedOnChart());
}
