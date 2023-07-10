import '../entity/sqlite_getable.dart';

abstract class SqliteStorable implements SqliteGetable {
  Map<String, Object?> toSqlite();
}
