class SelectableItem<T> {
  const SelectableItem(this.data,
      {required this.id, required this.initSelected, required this.selected});
  final int id;
  final T data;
  final bool initSelected;
  final bool selected;

  SelectableItem<T> copyWith({
    int? id,
    T? data,
    bool? initSelected,
    bool? selected,
  }) {
    return SelectableItem(
      data ?? this.data,
      id: id ?? this.id,
      initSelected: initSelected ?? this.initSelected,
      selected: selected ?? this.selected,
    );
  }

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType ||
      other is SelectableItem && other.data == data;

  @override
  int get hashCode => data.hashCode;
}
