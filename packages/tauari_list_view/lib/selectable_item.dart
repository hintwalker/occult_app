part of tauari_list_view;

class SelectableItem<T> {
  const SelectableItem(this.data, {required this.selected});
  final T data;
  final bool selected;
}
