import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import '../sort/chart_sort_value.dart';

SimpleTextGroup groupChartsBy(
  Chart item,
  SortValue? sortOption,
  String Function(String) translate,
) {
  if (sortOption == null ||
      sortOption.name == ChartSortValue.sortByNameAsc ||
      sortOption.name == ChartSortValue.sortByNameDesc) {
    final firstLetter = item.name.substring(0, 1);
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  } else if (sortOption.name == ChartSortValue.sortByCreatedAsc ||
      sortOption.name == ChartSortValue.sortByCreatedDesc) {
    return groupLabelFromDateTime(item.created, translate);
  } else if (sortOption.name == ChartSortValue.sortByLastViewAsc ||
      sortOption.name == ChartSortValue.sortByLastViewDesc) {
    return groupLabelFromDateTime(item.lastViewed, translate);
  } else if (sortOption.name == ChartSortValue.sortByBirthdayAsc ||
      sortOption.name == ChartSortValue.sortByBirthdayDesc) {
    return groupLabelFromDateTime(item.birthday, translate);
  } else {
    final firstLetter = item.name.substring(0, 1);
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  }
}
