part of lasotuvi_chart;

class ModifyChartAvatarWidget extends StatefulWidget {
  const ModifyChartAvatarWidget({
    super.key,
    required this.chart,
    required this.translate,
    required this.onUpdate,
  });
  final Chart chart;
  final String Function(String) translate;
  final void Function(Chart) onUpdate;

  @override
  State<ModifyChartAvatarWidget> createState() =>
      _ModifyChartAvatarWidgetState();
}

class _ModifyChartAvatarWidgetState
    extends ModifyState<String?, ModifyChartAvatarWidget> {
  @override
  void initState() {
    super.initState();
    value = widget.chart.avatar;
  }

  @override
  Widget build(BuildContext context) {
    return ModifyScaffold(
      translate: widget.translate,
      onSubmit: valid
          ? () => widget.onUpdate(
                widget.chart.copyWith(
                  avatar: value,
                ),
              )
          : null,
      body: ChartAvatarChosenWidget(
        translate: widget.translate,
        controller: ChartAvatarController(
          value: value,
          initGender: widget.chart.gender,
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
