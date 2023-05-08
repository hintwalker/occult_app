part of tauari_data_core;

abstract class SyncableEntity<T>
    implements Syncable<T>, SqliteStorable, Statable<T> {
  const SyncableEntity();
}
