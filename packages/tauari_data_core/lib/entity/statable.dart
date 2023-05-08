part of tauari_data_core;

abstract class Statable<T> {
  T copyWithState(String? state);
  String? get state;
}
