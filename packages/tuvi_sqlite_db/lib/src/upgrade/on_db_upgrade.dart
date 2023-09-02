import 'package:sqflite/sqflite.dart';
import 'package:tuvi_sqlite_db/src/upgrade/upgrade_1_to_2.dart';

Future<void> onDbUpgrade({
  required Database db,
  required int oldVersion,
  required int newVersion,
}) async {
  if (oldVersion == 1 && newVersion == 2) {
    await upgrade1To2(db);
  }
}
