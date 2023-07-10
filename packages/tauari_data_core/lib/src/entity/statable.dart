abstract class Statable<T> {
  T copyWithState(String? state);
  String? get state;
}
