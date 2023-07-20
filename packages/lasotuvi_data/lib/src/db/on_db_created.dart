import 'package:sqflite/sqflite.dart';

import 'sql_templates.dart';

Future<void> onDbCreated(Database db) async {
  await db.execute(SqlTemplates.dropTableChart());
  await db.execute(SqlTemplates.dropTableTag());
  await db.execute(SqlTemplates.dropTableChartTag());
  await db.execute(SqlTemplates.dropTableNote());
  await db.execute(SqlTemplates.dropTableCommentary());
  await db.execute(SqlTemplates.dropTableRequest());
  await db.execute(SqlTemplates.dropTableNotification());

  await db.execute(SqlTemplates.createTableChart());
  await db.execute(SqlTemplates.createIndexLastViewedOnChart());
  await db.execute(SqlTemplates.createIndexNameOnChart());

  await db.execute(SqlTemplates.createTableRequest());
  await db.execute(SqlTemplates.createIndexLastViewedOnRequest());
  await db.execute(SqlTemplates.createIndexNameOnRequest());

  await db.execute(SqlTemplates.createTableTag());
  await db.execute(SqlTemplates.createIndexTitleOnTag());

  await db.execute(SqlTemplates.createTableNote());

  await db.execute(SqlTemplates.createTableCommentary());

  await db.execute(SqlTemplates.createTableChartTag());
  await db.execute(SqlTemplates.createIndexOnChartTag());

  await db.execute(SqlTemplates.createTableNotification());
}
