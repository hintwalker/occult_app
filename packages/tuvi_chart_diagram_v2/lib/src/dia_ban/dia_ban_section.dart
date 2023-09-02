import 'package:flutter/material.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import 'chart_info/chart_info.dart';
import 'lines/lines_layer.dart';

class DiaBanSection extends StatelessWidget {
  const DiaBanSection({
    super.key,
    required this.chart,
    required this.humanBio,
    required this.colorScheme,
    required this.translate,
  });
  final TuViChart chart;
  final HumanBio humanBio;
  final ColorScheme colorScheme;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colorScheme.background,
        border: Border.all(color: colorScheme.onBackground, width: 0.5),
      ),
      child: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: LinesLayer(chart.posOfMenh.toInt()),
        child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ChartInfo(
              chart: chart,
              humanBio: humanBio,
              translate: translate,
              colorScheme: colorScheme,
            )),
      ),
    );
  }
}
