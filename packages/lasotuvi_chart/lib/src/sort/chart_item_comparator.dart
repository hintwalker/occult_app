import 'package:tauari_sort/tauari_sort.dart';

import 'chart_sort_value.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

int chartItemComparator(
  Chart item1,
  Chart item2,
  SortValue? sortOption,
) {
  if (sortOption == null || sortOption.name == ChartSortValue.sortByNameAsc) {
    return item1.name.compareTo(item2.name);
  } else if (sortOption.name == ChartSortValue.sortByNameDesc) {
    return item2.name.compareTo(item1.name);
  } else if (sortOption.name == ChartSortValue.sortByCreatedAsc) {
    return item1.created.compareTo(item2.created);
  } else if (sortOption.name == ChartSortValue.sortByCreatedDesc) {
    return item2.created.compareTo(item1.created);
  } else if (sortOption.name == ChartSortValue.sortByLastViewAsc) {
    return item1.lastViewed.compareTo(item2.lastViewed);
  } else if (sortOption.name == ChartSortValue.sortByLastViewDesc) {
    return item2.lastViewed.compareTo(item1.lastViewed);
  } else if (sortOption.name == ChartSortValue.sortByBirthdayAsc) {
    return item1.birthday.compareTo(item2.birthday);
  } else if (sortOption.name == ChartSortValue.sortByBirthdayDesc) {
    return item2.birthday.compareTo(item1.birthday);
  } else {
    return item1.name.compareTo(item2.name);
  }
}
