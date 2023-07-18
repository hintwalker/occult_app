import '../entity/star_item.dart';

bool starWhereClause(StarItem item, String query) {
  final RegExp regExp = RegExp(query, caseSensitive: false);
  return item.label.contains(regExp);
}
