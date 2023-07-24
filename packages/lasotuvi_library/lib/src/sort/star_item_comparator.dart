import 'package:lasotuvi_library/src/entity/star_item.dart';
import 'package:tauari_sort/tauari_sort.dart';

import 'star_sort_value.dart';

int starItemComparator(
  StarItem item1,
  StarItem item2,
  SortValue? sortOption,
) {
  if (sortOption == null || sortOption.name == StarSortValue.sortByNameAsc) {
    return item1.label.compareTo(item2.label);
  } else if (sortOption.name == StarSortValue.sortByNameDesc) {
    return item2.label.compareTo(item1.label);
  } else if (sortOption.name == StarSortValue.sortByDefaultAsc) {
    return item1.id.compareTo(item2.id);
  } else if (sortOption.name == StarSortValue.sortByDefaultDesc) {
    return item2.id.compareTo(item1.id);
  } else {
    return item1.id.compareTo(item2.id);
  }
}
