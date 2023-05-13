part of tauari_data_core;

abstract class Syncable<T> implements Sortable {
  T copyWithOnCloud(String? value);
  String? get onCloud;
}
