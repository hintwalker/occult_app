import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../controller/chart_list_controller.dart';
import '../builder/single_selectable_chart_list_builder.dart';

class SingleSelectableChartListModal extends StatelessWidget {
  const SingleSelectableChartListModal({
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
  final void Function(BuildContext, Chart, String? uid) onItemTap;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
      title: translate('selectOnChart'),
      colorScheme: colorScheme,
      child: SingleSelectableChartListBuilder(
          controller: controller,
          translate: translate,
          colorScheme: colorScheme,
          onItemTap: onItemTap,
          uid: uid),
    );
  }
}
