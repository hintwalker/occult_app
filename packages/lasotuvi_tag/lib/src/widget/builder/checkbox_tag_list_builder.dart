import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../controller/tag_has_charts_list_controller.dart';

class CheckboxTagListBuilder extends StatelessWidget {
  const CheckboxTagListBuilder({
    super.key,
    required this.uid,
    required this.controller,
    required this.child,
    // required this.chartId,
    // required this.translate,
    // required this.colorScheme,
    // required this.onCancel,
    // required this.onSubmit,
    // required this.onItemTap,
  });

  final TagHasChartsListController controller;
  final String? uid;
  final Widget Function(Iterable<TagHasCharts>) child;
  // final int chartId;
  // final String Function(String) translate;
  // final ColorScheme colorScheme;
  // final void Function(BuildContext context,
  //     Iterable<SelectableItem<TagHasCharts>> tags, String? uid) onSubmit;
  // final void Function(BuildContext context) onCancel;
  // final void Function(BuildContext context, Tag tag, String? uid) onItemTap;

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
            return child(snapshot.requireData);
            // CheckBoxTagListWidget(
            //   snapshot.requireData,
            //   uid: uid,
            //   chartId: chartId,
            //   translate: translate,
            //   colorScheme: colorScheme,
            //   onSubmit: onSubmit,
            //   onCancel: onCancel,
            //   onItemTap: onItemTap,
            // );
          } else {
            return const Center(
              child: ErrorTextWidget(),
            );
          }
        });
  }
}
