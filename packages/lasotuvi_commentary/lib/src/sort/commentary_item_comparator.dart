import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_sort/tauari_sort.dart';

import 'commentary_sort_value.dart';

int commentaryItemComparator(
  Commentary item1,
  Commentary item2,
  SortValue? sortOption,
) {
  if (sortOption == null ||
      sortOption.name == CommentarySortValue.sortByEditedAsc) {
    return item1.lastViewed.compareTo(item2.lastViewed);
  } else if (sortOption.name == CommentarySortValue.sortByEditedDesc) {
    return item2.lastViewed.compareTo(item1.lastViewed);
  } else if (sortOption.name == CommentarySortValue.sortByCreatedAsc) {
    return item1.created.compareTo(item2.created);
  } else if (sortOption.name == CommentarySortValue.sortByCreatedDesc) {
    return item2.created.compareTo(item1.created);
  } else if (sortOption.name == CommentarySortValue.sortByTitleAsc) {
    return item1.title.compareTo(item2.title);
  } else if (sortOption.name == CommentarySortValue.sortByTitleDesc) {
    return item2.title.compareTo(item1.title);
  } else {
    return item2.lastViewed.compareTo(item1.lastViewed);
  }
}
