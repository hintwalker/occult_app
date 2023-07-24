import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_sort/tauari_sort.dart';

import '../sort/tag_sort_value.dart';

SimpleTextGroup groupTagsBy(
  Tag item,
  SortValue? sortOption,
  String Function(String) translate,
) {
  if (sortOption == null ||
      sortOption.name == TagSortValue.sortByTitleAsc ||
      sortOption.name == TagSortValue.sortByTitleDesc) {
    final firstLetter = item.title.substring(0, 1);
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  } else {
    return groupLabelFromDateTime(item.created, translate);
  }
}
