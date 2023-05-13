part of tauari_data_core;

abstract class SqliteStorable implements SqliteGetable, Dumpable, Entity {
  Map<String, Object?> toSqlite();
}
