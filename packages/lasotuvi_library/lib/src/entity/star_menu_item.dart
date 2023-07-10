class StarMenuItem {
  final String name;
  const StarMenuItem({required this.name});

  factory StarMenuItem.fromMap(Map<String, Object?> map) {
    return StarMenuItem(name: map['name'] as String);
  }
}
