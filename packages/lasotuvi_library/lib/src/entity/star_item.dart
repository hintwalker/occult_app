class StarItem {
  final int id;
  final String name;
  final String label;
  const StarItem({
    required this.id,
    required this.name,
    required this.label,
  });

  factory StarItem.fromMap(Map<String, dynamic> map) {
    return StarItem(
      id: map['id'] as int,
      name: map['name'] as String,
      label: map['label'] as String,
    );
  }

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType && other is StarItem && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
