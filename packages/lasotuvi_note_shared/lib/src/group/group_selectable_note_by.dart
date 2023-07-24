import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_sort/tauari_sort.dart';
import 'group_notes_by.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

SimpleTextGroup groupSelectableNotesBy(
  SelectableItem<Note> item,
  SortValue? sortOption,
  String Function(String) translate,
) =>
    groupNotesBy(item.data, sortOption, translate);
