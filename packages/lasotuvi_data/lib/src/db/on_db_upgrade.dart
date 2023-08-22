import 'package:sqflite/sqflite.dart';

import 'sql_templates.dart';

Future<void> onDbUpgrade({
  required Database db,
  required int oldVersion,
  required int newVersion,
}) async {
  if (oldVersion == 1 && newVersion == 2) {
    await db.execute(SqlTemplates.upgrade1_2());
  }
}
