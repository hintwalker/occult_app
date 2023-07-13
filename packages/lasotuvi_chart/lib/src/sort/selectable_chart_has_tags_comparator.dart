import 'chart_item_comparator.dart';

import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

int selectableChartHasTagsComparator(
  SelectableItem<ChartHasTags> item1,
  SelectableItem<ChartHasTags> item2,
  SortValue? sortOption,
) =>
    chartItemComparator(item1.data.source, item2.data.source, sortOption);
