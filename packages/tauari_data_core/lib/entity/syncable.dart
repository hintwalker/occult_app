part of tauari_data_core;

abstract class Syncable<T> implements CloudStorable {
  T copyWithOnCloud(String? value);
  String? get onCloud;
}
