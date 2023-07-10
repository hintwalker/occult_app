import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../controller/chart_detail_controller.dart';

class ChartDetailBuilder extends StatelessWidget {
  const ChartDetailBuilder({
    super.key,
    required this.uid,
    required this.chartId,
    // required this.translate,
    // required this.colorScheme,
    required this.controller,
    required this.syncStatus,
    required this.child,
  });
  // final String Function(String) translate;
  // final ColorScheme colorScheme;
  final ChartDetailController controller;
  final String? uid;
  final String chartId;
  final String? syncStatus;
  final Widget Function(Chart chart) child;

  @override
  Widget build(BuildContext context) {
    final docId = int.tryParse(chartId);
    return docId == null
        ? const ErrorTextWidget()
        : StreamBuilder(
            stream: controller.stream(
              uid: uid,
              docId: docId,
              syncStatus: syncStatus,
            ),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else if (snapshot.hasData) {
                final chart = snapshot.requireData;
                return chart == null ? const ErrorTextWidget() : child(chart);
                // ChartDetailWidget(
                //   chart,
                //   translate: translate,
                //   colorScheme: colorScheme,
                // );
              } else {
                return const ErrorTextWidget();
              }
            });
  }
}
