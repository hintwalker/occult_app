import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_chart_creation_form/tuvi_chart_creation_form.dart';
import 'modify_state.dart';
import 'scaffold/modify_scaffold.dart';

class ModifyChartNameWidget extends StatefulWidget {
  const ModifyChartNameWidget(
    this.chart, {
    super.key,
    required this.translate,
    required this.onUpdate,
  });
  // final String? uid;
  final Chart? chart;

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
    value = widget.chart?.name;
  }

  @override
  Widget build(BuildContext context) {
    return widget.chart == null
        ? const Center(child: ErrorTextWidget())
        : ModifyScaffold(
            translate: widget.translate,
            onSubmit: valid
                ? () => widget.onUpdate(
                      widget.chart!.copyWith(
                        name: value,
                      ),
                    )
                : null,
            body: ChartNameInput(
              translate: widget.translate,
              controller: ChartNameController(
                value: widget.chart!.name,
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
