import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';

final chartOptionsModalControllerProvider =
    ChangeNotifierProvider<ChartOptionsModalController>(
  (ref) => ChartOptionsModalController(),
);
