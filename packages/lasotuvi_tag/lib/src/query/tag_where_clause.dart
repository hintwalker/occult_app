import 'package:lasotuvi_domain/lasotuvi_domain.dart' show Tag;

bool tagWhereClause(Tag item, String query) {
  return item.title.contains(RegExp(query, caseSensitive: false)) ||
      item.subTitle.contains(RegExp(query, caseSensitive: false));
}
