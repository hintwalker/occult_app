import 'package:lasotuvi_library/src/entity/book_item.dart';

bool chartWhereClause(BookItem item, String query) {
  final RegExp regExp = RegExp(query, caseSensitive: false);
  return item.label.contains(regExp);
}
