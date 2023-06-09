part of tauari_list_view;

class SimpleTextGroup {
  const SimpleTextGroup(
    this.data,
    this.label,
  );
  final String data;
  final String label;

  @override
  bool operator ==(Object? other) {
    if (other is SimpleTextGroup) {
      return other.data.trim().toLowerCase() == data.trim().toLowerCase();
    }
    return false;
  }

  @override
  int get hashCode => data.trim().toLowerCase().hashCode;
}
