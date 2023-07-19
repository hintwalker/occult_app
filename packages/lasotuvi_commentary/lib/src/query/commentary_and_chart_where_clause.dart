import 'package:lasotuvi_domain/lasotuvi_domain.dart' show CommentaryAndChart;

bool commentaryAndChartWhereClause(CommentaryAndChart item, String query) {
  final RegExp regExp = RegExp(query, caseSensitive: false);
  return item.entity1!.title.contains(regExp) ||
      item.entity1!.content.contains(regExp) ||
      item.entity2!.name.contains(regExp);
}
