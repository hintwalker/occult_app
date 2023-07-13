import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_chart_creation_form/tuvi_chart_creation_form.dart';
import 'modify_state.dart';
import 'scaffold/modify_scaffold.dart';

class ModifyChartAvatarWidget extends StatefulWidget {
  const ModifyChartAvatarWidget(
    this.chart, {
    super.key,
    required this.translate,
    required this.onUpdate,
  });
  final Chart? chart;
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
    value = widget.chart?.avatar;
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
                        avatar: value,
                      ),
                    )
                : null,
            body: ChartAvatarChosenWidget(
              translate: widget.translate,
              controller: ChartAvatarController(
                value: value,
                initGender: widget.chart!.gender,
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
