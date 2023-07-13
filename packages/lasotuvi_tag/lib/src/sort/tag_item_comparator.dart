import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import 'tag_sort_value.dart';

int tagItemComparator(
  Tag item1,
  Tag item2,
  SortValue? sortOption,
) {
  if (sortOption == null || sortOption.name == TagSortValue.sortByTitleAsc) {
    return item1.title.compareTo(item2.title);
  } else if (sortOption.name == TagSortValue.sortByTitleDesc) {
    return item2.title.compareTo(item1.title);
  } else if (sortOption.name == TagSortValue.sortByCreatedAsc) {
    return item1.created.compareTo(item2.created);
  } else if (sortOption.name == TagSortValue.sortByCreatedDesc) {
    return item2.created.compareTo(item1.created);
  } else {
    return item1.title.compareTo(item2.title);
  }
}
