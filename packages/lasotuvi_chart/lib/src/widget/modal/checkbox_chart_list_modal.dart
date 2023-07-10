import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../controller/chart_has_tags_list_controller.dart';
import '../builder/checkbox_chart_list_builder.dart';

class CheckboxChartListModal extends StatelessWidget {
  const CheckboxChartListModal({
    super.key,
    this.uid,
    // required this.tagId,
    required this.controller,
    required this.translate,
    required this.colorScheme,
    required this.child,
    // required this.onCancel,
    // required this.onSubmit,
    // required this.onItemTap,
  });

  final ChartHasTagsListController controller;
  final String? uid;
  // final int tagId;
  final String Function(String) translate;
  final Widget Function(Iterable<ChartHasTags> chartHasTags) child;
  final ColorScheme colorScheme;
  // final void Function(BuildContext context) onCancel;
  // final void Function(BuildContext context,
  //     Iterable<SelectableItem<ChartHasTags>> charts, String? uid) onSubmit;
  // final void Function(BuildContext context, Chart chart, String? uid) onItemTap;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
      title: translate('selectChart'),
      colorScheme: colorScheme,
      child: CheckboxChartListBuilder(
        uid: uid,
        // tagId: tagId,
        controller: controller,
        child: child,
        // translate: translate,
        // colorScheme: colorScheme,
        // onCancel: onCancel,
        // onSubmit: onSubmit,
        // onItemTap: onItemTap,
      ),
    );
  }
}
