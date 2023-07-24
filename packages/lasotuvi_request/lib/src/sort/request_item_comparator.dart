import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_sort/tauari_sort.dart';

import 'request_sort_value.dart';

int requestItemComparator(
  Request item1,
  Request item2,
  SortValue? sortOption,
) {
  if (sortOption == null ||
      sortOption.name == RequestSortValue.sortByLastViewedAsc) {
    return item1.lastViewed.compareTo(item2.lastViewed);
  } else if (sortOption.name == RequestSortValue.sortByLastViewedDesc) {
    return item2.lastViewed.compareTo(item1.lastViewed);
  } else if (sortOption.name == RequestSortValue.sortByCreatedAsc) {
    return item1.created.compareTo(item2.created);
  } else if (sortOption.name == RequestSortValue.sortByCreatedDesc) {
    return item2.created.compareTo(item1.created);
  } else if (sortOption.name == RequestSortValue.sortByNameAsc) {
    return item1.name.compareTo(item2.name);
  } else if (sortOption.name == RequestSortValue.sortByNameDesc) {
    return item2.name.compareTo(item1.name);
  } else {
    return item2.lastViewed.compareTo(item1.lastViewed);
  }
}
