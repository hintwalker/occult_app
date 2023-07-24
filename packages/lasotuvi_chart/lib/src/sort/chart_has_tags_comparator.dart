import 'package:tauari_sort/tauari_sort.dart';

import 'chart_item_comparator.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

int chartHasTagsComparator(
  ChartHasTags item1,
  ChartHasTags item2,
  SortValue? sortOption,
) =>
    chartItemComparator(item1.source, item2.source, sortOption);
