import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'tag_item_comparator.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

int selectableTagHasChartsComparator(
  SelectableItem<TagHasCharts> item1,
  SelectableItem<TagHasCharts> item2,
  SortValue? sortOption,
) =>
    tagItemComparator(item1.data.source, item2.data.source, sortOption);
