import 'note_item_comparator.dart';

import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

int selectableChartHasTagsComparator(
  SelectableItem<Note> item1,
  SelectableItem<Note> item2,
  SortValue? sortOption,
) =>
    noteItemComparator(item1.data, item2.data, sortOption);
