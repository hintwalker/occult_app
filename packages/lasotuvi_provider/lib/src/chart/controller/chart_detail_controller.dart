import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';

import '../usecase/take_chart.dart';

final chartDetailControllerProvider = Provider((ref) => ChartDetailController(
      ref.read(takeChartProvider),
    ));
  //   ChangeNotifierProvider.autoDispose<ChartDetailController>(
  // (ref) => ChartDetailController(
  //   // ref.read(onChartProvider),
  //   // onSyncableData: ref.read(onChartProvider),
  //   ref.read(takeChartProvider),
  // ),
// );
