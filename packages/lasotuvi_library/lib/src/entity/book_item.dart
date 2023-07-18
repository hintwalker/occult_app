class BookItem {
  final String name;
  final String label;
  final String author;
  final String url;
  final int page;
  const BookItem({
    required this.name,
    required this.label,
    required this.author,
    required this.page,
    required this.url,
  });

  factory BookItem.fromMap(Map<String, Object?> map) {
    return BookItem(
      name: map['name'] as String,
      label: map['label'] as String,
      author: map['author'] as String,
      page: map['page'] as int,
      url: map['url'] as String,
    );
  }
}
