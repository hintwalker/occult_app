import 'package:lasotuvi_domain/lasotuvi_domain.dart' show Tag;

bool tagWhereClause(Tag item, String query) {
  final RegExp regExp = RegExp(query, caseSensitive: false, unicode: true);
  return item.title.contains(regExp) || item.subTitle.contains(regExp);
}
