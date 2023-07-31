import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuvi_chart_diagram/tuvi_chart_diagram.dart';

final tuviChartGridControllerProvider =
    ChangeNotifierProvider.autoDispose<TuviChartGridController>(
  (_) => TuviChartGridController(),
);
