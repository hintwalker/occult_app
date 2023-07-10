import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tuvi_chart_creation_form/tuvi_chart_creation_form.dart';
import 'package:tuvi_domain/tuvi_domain.dart';
import 'modify_state.dart';
import 'scaffold/modify_scaffold.dart';

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
