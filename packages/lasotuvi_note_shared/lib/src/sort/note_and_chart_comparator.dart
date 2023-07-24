import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_sort/tauari_sort.dart';

import 'note_item_comparator.dart';
import 'note_sort_value.dart';

int noteAndChartComparator(
    NoteAndChart item1, NoteAndChart item2, SortValue? sortOption) {
  if (sortOption == null ||
      sortOption.name == NoteSortValue.sortByChartNameAsc) {
    return item1.entity2!.name.compareTo(item2.entity2!.name);
  } else if (sortOption.name == NoteSortValue.sortByChartNameDesc) {
    return item2.entity2!.name.compareTo(item1.entity2!.name);
  } else {
    return noteItemComparator(item1.entity1!, item2.entity1!, sortOption);
  }
}
