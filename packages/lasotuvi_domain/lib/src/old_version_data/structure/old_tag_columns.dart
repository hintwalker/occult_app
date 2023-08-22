class OldTagColumns {
  static const name = 'name';
  static const description = 'description';
  static const createdDate = 'createdDate';
  static const tagId = 'tagId';
  static const List<String> migratedColumns = [
    tagId,
    name,
    description,
    createdDate,
  ];
}
