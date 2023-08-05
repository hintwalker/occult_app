import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class SingleSelectableChartListModal extends StatelessWidget {
  const SingleSelectableChartListModal({
    super.key,
    // required this.controller,
    required this.translate,
    required this.colorScheme,
    required this.child,
    // required this.onItemTap,
    // this.uid,
  });

  // final ChartListController controller;
  // final String? uid;

  final String Function(String) translate;
  final ColorScheme colorScheme;
  final Widget child;
  // final void Function(BuildContext, Chart, String? uid) onItemTap;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
      title: translate('selectOneChart'),
      colorScheme: colorScheme,
      child: child,
      // child: SingleSelectableChartListBuilder(
      //     controller: controller,
      //     translate: translate,
      //     colorScheme: colorScheme,
      //     onItemTap: onItemTap,
      //     uid: uid),
    );
  }
}
