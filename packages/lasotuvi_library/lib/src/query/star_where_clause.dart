import '../entity/star_item.dart';

bool starWhereClause(
  StarItem item,
  String query, {
  required String Function(String) translate,
}) {
  final RegExp regExp = RegExp(query, caseSensitive: false, unicode: true);
  return translate(item.label).contains(regExp);
}
