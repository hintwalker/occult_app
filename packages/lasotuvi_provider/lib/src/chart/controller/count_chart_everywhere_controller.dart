import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart_shared/lasotuvi_chart_shared.dart';
import '../usecase/on_count_chart.dart';

final countChartEveryWhereControllerProvider =
    ChangeNotifierProvider.autoDispose<CountChartEveryWhereController>(
  (ref) => CountChartEveryWhereController(
    ref.read(onCountChartProvider),
  ),
);
