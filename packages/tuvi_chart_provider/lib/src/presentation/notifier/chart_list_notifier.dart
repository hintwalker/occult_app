import 'package:riverpod/riverpod.dart';
import 'package:tuvi_chart_presentation/tuvi_chart_presentation.dart';
import 'package:tuvi_chart_provider/src/usecase/on_charts.dart';

final chartListNotifierProvider =
    StateNotifierProvider<ChartListNotifier, ChartListState>(
  (ref) => ChartListNotifier(
    onData: ref.read(onChartsProvider),
  ),
);
