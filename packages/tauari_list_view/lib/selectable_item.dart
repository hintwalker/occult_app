part of tauari_list_view;

class SelectableItem<T> {
  const SelectableItem(this.data,
      {required this.initSelected, required this.selected});
  final T data;
  final bool initSelected;
  final bool selected;

  SelectableItem<T> copyWith({
    T? data,
    bool? initSelected,
    bool? selected,
  }) {
    return SelectableItem(
      data ?? this.data,
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
