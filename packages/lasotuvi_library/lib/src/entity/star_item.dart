class StarItem {
  final String name;
  final String label;
  const StarItem({
    required this.name,
    required this.label,
  });

  factory StarItem.fromMap(Map<String, Object?> map) {
    return StarItem(
      name: map['name'] as String,
      label: map['label'] as String,
    );
  }
}
