class BookItem {
  final int id;
  final String name;
  final String label;
  final String author;
  final String url;
  final int page;
  const BookItem({
    required this.id,
    required this.name,
    required this.label,
    required this.author,
    required this.page,
    required this.url,
  });

  factory BookItem.fromMap(Map<String, dynamic> map) {
    return BookItem(
      id: map['id'] as int,
      name: map['name'] as String,
      label: map['label'] as String,
      author: map['author'] as String,
      page: map['page'] as int,
      url: map['url'] as String,
    );
  }

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType && other is BookItem && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
