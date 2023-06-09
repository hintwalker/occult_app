part of tauari_data_core;

abstract class Syncable<T> implements Sortable {
  T copyWithSyncStatus(String? value);
  String? get getSyncStatus;
}
