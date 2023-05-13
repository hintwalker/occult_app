part of tauari_data_core;

class SetOfEntity<T extends Syncable> {
  final Set<T> _items;

  const SetOfEntity(this._items);

  int get length => _items.length;

  List<T> toList() => _items.toList();

  T operator [](int index) {
    return _items.elementAt(index);
  }

  factory SetOfEntity.fromNullableList(List<T?> list) {
    return SetOfEntity<T>(list.whereType<T>().toSet());
  }

  factory SetOfEntity.fromList(Iterable<T> list) {
    return SetOfEntity<T>(list.toSet());
  }

  Set<T> get items => _items;
  SetOfEntity<T> updateOnCloud(String value) {
    final list = _items.toList();
    for (var i = 0; i < list.length; i++) {
      list[i] = list[i].copyWithOnCloud(value);
    }
    return SetOfEntity<T>.fromList(list);
  }

  SetOfEntity<T> intersection(SetOfEntity<T> other) {
    return SetOfEntity<T>(_items.intersection(other.items));
  }

  SetOfEntity<T> difference(SetOfEntity<T> other) {
    return SetOfEntity<T>(_items.difference(other.items));
  }

  SetOfEntity<T> union(SetOfEntity<T> other) {
    return SetOfEntity<T>(_items.union(other.items));
  }

  // Map<String, Object?> dump() {
  //   final Map<String, Object?> result = {};
  //   for (var i = 0; i < _items.length; i++) {
  //     final element = this[i];
  //     result.addAll({element.docId: element.dump()});
  //   }
  //   return result;
  // }
}
