import 'package:sqflite/sqflite.dart';
import 'package:tuvi_sqlite_db/src/creation/create_table_chart.dart';

Future<void> onDbCreated(Database db) async {
  await createTableChart(db);
}
