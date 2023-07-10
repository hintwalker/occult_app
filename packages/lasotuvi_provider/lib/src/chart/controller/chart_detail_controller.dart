import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';

import '../usecase/on_chart.dart';

final chartDetailControllerProvider =
    ChangeNotifierProvider.autoDispose<ChartDetailController>(
  (ref) => ChartDetailController(
    onSyncableData: ref.read(onChartProvider),
  ),
);
