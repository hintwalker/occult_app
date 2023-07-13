import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import 'note_sort_value.dart';

int noteItemComparator(
  Note item1,
  Note item2,
  SortValue? sortOption,
) {
  if (sortOption == null || sortOption.name == NoteSortValue.sortByEditedAsc) {
    return item1.edited.compareTo(item2.edited);
  } else if (sortOption.name == NoteSortValue.sortByEditedDesc) {
    return item2.edited.compareTo(item1.edited);
  } else if (sortOption.name == NoteSortValue.sortByCreatedAsc) {
    return item1.created.compareTo(item2.created);
  } else if (sortOption.name == NoteSortValue.sortByCreatedDesc) {
    return item2.created.compareTo(item1.created);
  } else if (sortOption.name == NoteSortValue.sortByTitleAsc) {
    return item1.title.compareTo(item2.title);
  } else if (sortOption.name == NoteSortValue.sortByTitleDesc) {
    return item2.title.compareTo(item1.title);
  } else {
    return item1.edited.compareTo(item2.edited);
  }
}
