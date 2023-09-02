import 'package:lasotuvi_domain/lasotuvi_domain.dart' show CommentaryAndRequest;

bool commentaryAndRequestWhereClause(CommentaryAndRequest item, String query) {
  final RegExp regExp = RegExp(query, caseSensitive: false, unicode: true);
  return item.entity1!.title.contains(regExp) ||
      item.entity1!.content.contains(regExp) ||
      item.entity2!.name.contains(regExp);
}
