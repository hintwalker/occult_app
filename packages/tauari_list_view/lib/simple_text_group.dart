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
    bool result = false;
    if (other is SimpleTextGroup) {
      result = other.data.trim().toLowerCase() == data.trim().toLowerCase();
    }
    return result;
  }

  @override
  int get hashCode => data.trim().toLowerCase().hashCode;
}
