import 'package:tauari_sort/tauari_sort.dart';

import 'commentary_item_comparator.dart';

import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

int selectableChartHasTagsComparator(
  SelectableItem<Commentary> item1,
  SelectableItem<Commentary> item2,
  SortValue? sortOption,
) =>
    commentaryItemComparator(item1.data, item2.data, sortOption);
