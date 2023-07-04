part of lasotuvi_chart;

class ModifyGenderWidget extends StatefulWidget {
  const ModifyGenderWidget({
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
  State<ModifyGenderWidget> createState() => _ModifyGenderWidgetState();
}

class _ModifyGenderWidgetState extends ModifyState<Gender, ModifyGenderWidget> {
  @override
  void initState() {
    super.initState();
    value = widget.chart.gender;
  }

  @override
  Widget build(BuildContext context) {
    return ModifyScaffold(
      translate: widget.translate,
      body: ChartGenderInput(
          colorScheme: widget.colorScheme,
          translate: widget.translate,
          controller: GenderController(
            value: value!,
            updateValid: (event) => setState(() {
              valid = event;
            }),
            updateValue: (event) => setState(() {
              value = event;
            }),
          )),
      onSubmit: valid
          ? () => widget.onUpdate(
                widget.chart.copyWith(
                  gender: value,
                ),
              )
          : null,
    );
  }
}
