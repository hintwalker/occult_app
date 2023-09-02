import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';

// import 'execute_build_chart.dart';
import 'grid.dart';
import 'tuvi_chart_grid_controller.dart';

class TuviChartContainer extends StatelessWidget {
  const TuviChartContainer(
    this.data, {
    super.key,
    required this.translate,
    required this.colorScheme,
    required this.controller,
  });
  final Chart data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final TuviChartGridController controller;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context);
    final size = screen.size;
    return BasicFutureBuilder(
      future: controller.future(data),
      child: (data) => data == null
          ? const SizedBox.shrink()
          : SizedBox(
              width: size.width,
              height:
                  size.height - 48 - screen.padding.top - screen.padding.bottom,
              child: TuviChartGrid(
                data,
                translate: translate,
                colorScheme: colorScheme,
                controller: controller,
                humanBio: data.humanBio,
              ),
            ),
    );
  }
}
