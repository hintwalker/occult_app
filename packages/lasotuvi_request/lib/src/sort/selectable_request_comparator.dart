import 'request_item_comparator.dart';

import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

int selectableChartHasTagsComparator(
  SelectableItem<Request> item1,
  SelectableItem<Request> item2,
  SortValue? sortOption,
) =>
    requestItemComparator(item1.data, item2.data, sortOption);
