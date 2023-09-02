// import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';

class ChartCreationState {
  const ChartCreationState({
    required this.chart,
    required this.valid,
  });
  final Chart chart;
  final bool valid;
  ChartCreationState copyWith({Chart? chart, bool? valid}) {
    return ChartCreationState(
      chart: chart ?? this.chart,
      valid: valid ?? this.valid,
    );
  }
}
