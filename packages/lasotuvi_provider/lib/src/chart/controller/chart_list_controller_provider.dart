import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';

import '../usecase/on_charts_provider.dart';

final chartListControllerProvider =
    ChangeNotifierProvider.autoDispose<ChartListController>(
        (ref) => ChartListController(onCharts: ref.read(onChartsProvider)));
