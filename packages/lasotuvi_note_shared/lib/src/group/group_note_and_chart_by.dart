import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_sort/tauari_sort.dart';

import '../sort/note_sort_value.dart';
import 'group_notes_by.dart';

SimpleTextGroup groupNoteAndChartBy(
  NoteAndChart item,
  SortValue? sortOption,
  String Function(String) translate,
) {
  if (sortOption == null ||
      sortOption.name == NoteSortValue.sortByChartNameAsc ||
      sortOption.name == NoteSortValue.sortByChartNameDesc) {
    final firstLetter = item.entity2!.name;
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  } else {
    return groupNotesBy(item.entity1!, sortOption, translate);
  }
}
