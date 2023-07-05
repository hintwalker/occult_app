part of lasotuvi_chart;

class ModifyWatchingYearWidget extends StatefulWidget {
  const ModifyWatchingYearWidget({
    super.key,
    required this.chart,
    required this.colorScheme,
    required this.translate,
    required this.onUpdate,
  });

  final Chart chart;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(Chart chart) onUpdate;

  @override
  State<ModifyWatchingYearWidget> createState() =>
      _ModifyWatchingYearWidgetState();
}

class _ModifyWatchingYearWidgetState
    extends ModifyState<String, ModifyWatchingYearWidget> {
  @override
  Widget build(BuildContext context) {
    return ModifyScaffold(
      translate: widget.translate,
      onSubmit: valid
          ? () {
              if (value != null) {
                final year = int.tryParse(value!);
                widget.onUpdate(
                  widget.chart.copyWith(
                    watchingYear: year,
                  ),
                );
              }
            }
          : null,
      body: ChartWatchingYearInput(
        colorScheme: widget.colorScheme,
        translate: widget.translate,
        controller: WatchingYearController(
          value: widget.chart.watchingYear.toString(),
          updateValid: (event) => setState(() {
            valid = event;
          }),
          updateValue: (event) => setState(() {
            value = event;
          }),
        ),
      ),
    );
  }
}
