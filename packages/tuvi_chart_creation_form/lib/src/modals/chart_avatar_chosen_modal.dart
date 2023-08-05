import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../controller/chart_avatar_controller.dart';
import '../forms/chart_avatar_chosen_widget.dart';

class ChartAvatarChosenModal extends ConsumerWidget {
  const ChartAvatarChosenModal({
    super.key,
    required this.controller,
    required this.translate,
    required this.chartId,
  });

  final ChartAvatarController controller;
  final String Function(String) translate;
  final String chartId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(chartCreationNotifierProvider);
    return BasicDialog(title: translate('selectAvatar'), children: [
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: ChartAvatarChosenWidget(
          controller: controller,
          translate: translate,
          chartId: chartId,
        ),
      )
    ]);
  }
}
