import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import 'commentary_item_comparator.dart';
import 'commentary_sort_value.dart';

int commentaryAndChartComparator(
    CommentaryAndChart item1, CommentaryAndChart item2, SortValue? sortOption) {
  if (sortOption == null ||
      sortOption.name == CommentarySortValue.sortByChartNameAsc) {
    return item1.entity2!.name.compareTo(item2.entity2!.name);
  } else if (sortOption.name == CommentarySortValue.sortByChartNameDesc) {
    return item2.entity2!.name.compareTo(item1.entity2!.name);
  } else {
    return commentaryItemComparator(item1.entity1!, item2.entity1!, sortOption);
  }
}
