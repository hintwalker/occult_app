import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import '../sort/commentary_sort_value.dart';
import 'group_commentary_by.dart';

SimpleTextGroup groupCommentaryAndChartBy(
  CommentaryAndChart item,
  SortValue? sortOption,
  String Function(String) translate,
) {
  if (sortOption == null ||
      sortOption.name == CommentarySortValue.sortByChartNameAsc ||
      sortOption.name == CommentarySortValue.sortByChartNameDesc) {
    final firstLetter = item.entity2!.name;
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  } else {
    return groupCommentaryBy(item.entity1!, sortOption, translate);
  }
}
