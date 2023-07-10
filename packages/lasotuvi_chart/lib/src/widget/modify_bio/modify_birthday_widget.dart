import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tuvi_chart_creation_form/tuvi_chart_creation_form.dart';

import 'modify_state.dart';
import 'scaffold/modify_scaffold.dart';

class ModifyBirthdayWidget extends StatefulWidget {
  const ModifyBirthdayWidget(
    this.chart, {
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.onUpdate,
  });
  final Chart chart;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(Chart chart) onUpdate;

  @override
  State<ModifyBirthdayWidget> createState() => _ModifyBirthdayWidgetState();
}

class _ModifyBirthdayWidgetState
    extends ModifyState<Moment, ModifyBirthdayWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = BirthdayController(
      value: widget.chart.birthday.toMoment(
        TimeZone(offsetInHour: widget.chart.timeZoneOffset),
      ),
      updateValid: (p0) => setState(() {
        valid = p0;
      }),
      updateValue: (event) => setState(() {
        value = event;
      }),
    );
    return ModifyScaffold(
      translate: widget.translate,
      body: ChartBirthdayInput(
        colorScheme: widget.colorScheme,
        translate: widget.translate,
        controller: controller,
      ),
      onSubmit: valid
          ? () => widget.onUpdate(
                widget.chart.copyWith(
                  birthday: value?.toDateTime(),
                ),
              )
          : null,
    );
  }
}
