import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../../controller/chart_list_controller.dart';
import '../single_selectable_chart_list_widget.dart';

class SingleSelectableChartListBuilder extends StatelessWidget {
  const SingleSelectableChartListBuilder({
    super.key,
    required this.controller,
    required this.translate,
    required this.colorScheme,
    required this.onItemTap,
    this.uid,
  });

  final ChartListController controller;
  final String? uid;

  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext, Chart chart, String? uid) onItemTap;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.stream(uid, QueryArgs(uid: uid)),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return SingleSelectableChartListWidget(
              snapshot.requireData,
              translate: translate,
              colorScheme: colorScheme,
              onItemTap: onItemTap,
              uid: uid,
            );
          } else {
            return const Center(
              child: ErrorTextWidget(),
            );
          }
        });
  }
}
