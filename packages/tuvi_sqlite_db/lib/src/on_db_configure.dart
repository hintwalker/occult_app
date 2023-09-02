import 'package:sqflite/sqflite.dart';

Future<void> onDbConfigure(Database db) async {
  await db.execute('PRAGMA foreign_keys = ON;');
}
