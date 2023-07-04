part of lasotuvi_chart;

class ModifyChartNameWidget extends StatefulWidget {
  const ModifyChartNameWidget({
    super.key,
    // required this.uid,
    required this.chart,
    required this.translate,
    required this.onUpdate,
  });
  // final String? uid;
  final Chart chart;

  final String Function(String) translate;
  final void Function(Chart chart) onUpdate;

  @override
  State<ModifyChartNameWidget> createState() => _ModifyChartNameWidgetState();
}

class _ModifyChartNameWidgetState
    extends ModifyState<String, ModifyChartNameWidget> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    value = widget.chart.name;
  }

  @override
  Widget build(BuildContext context) {
    return ModifyScaffold(
      translate: widget.translate,
      onSubmit: valid
          ? () => widget.onUpdate(
                widget.chart.copyWith(
                  name: value,
                ),
              )
          : null,
      body: ChartNameInput(
        translate: widget.translate,
        controller: ChartNameController(
          value: widget.chart.name,
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
