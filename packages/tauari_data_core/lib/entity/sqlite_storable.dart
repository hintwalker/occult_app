part of tauari_data_core;

abstract class SqliteStorable implements Dumpable, Entity {
  Map<String, Object?> toSqlite();
  int get primaryKey;
}
