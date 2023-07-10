import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';

import '../usecase/on_chart_has_tags_list.dart';

final chartHasTagsListControllerProvider = ChangeNotifierProvider.autoDispose(
    (ref) => ChartHasTagsListController(
        onData: ref.read(onChartHasTagsListProvider)));
