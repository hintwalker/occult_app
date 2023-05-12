part of lasotuvi_data;

Future<void> onDbConfigure(Database db) async {
  await db.execute(SqlTemplates.turnOnForeignKey);
}
