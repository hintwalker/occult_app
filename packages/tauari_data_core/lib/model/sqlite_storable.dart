part of tauari_data_core;

abstract class SqliteStorable implements SqliteGetable {
  Map<String, Object?> toSqlite();
}
