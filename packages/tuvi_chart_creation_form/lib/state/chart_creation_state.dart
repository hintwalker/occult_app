part of tuvi_chart_creation_form;

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
