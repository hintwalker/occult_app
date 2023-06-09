part of lasotuvi_provider;

final sqliteTagDataSourceProvider = Provider.autoDispose<SqliteTagDataSource>(
    (ref) => SqliteTagDataSource(ref.read(tagDaoProvider)));
