import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../chart_creation_notifier.dart';
import '../controller/chart_avatar_controller.dart';
import '../modals/chart_avatar_chosen_modal.dart';

class ChartAvatarInput extends ConsumerWidget {
  ChartAvatarInput({
    super.key,
    required this.translate,
    required this.chartId,
  });
  final String Function(String) translate;
  final imagePicker = ImagePicker();
  final String chartId;

  void showModal({
    required BuildContext context,
    required String? initAvatar,
    required Gender initGender,
    required WidgetRef ref,
  }) {
    showDialog(
        context: context,
        builder: (ctx) =>
            // Material(child:
            ChartAvatarChosenModal(
                translate: translate,
                controller: ChartAvatarController(
                  value: initAvatar,
                  updateValid: (value) => ref
                      .read(chartCreationNotifierProvider.notifier)
                      .updateValid(value),
                  updateValue: (value) => ref
                      .read(chartCreationNotifierProvider.notifier)
                      .updateAvatar(value),
                  initGender: initGender,
                ),
                chartId: chartId)
        // )
        );
    // showModalBottomSheet(
    //     context: context, builder: (ctx) => ChartAvatarChosenModal());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chartCreationNotifierProvider);
    return SizedBox(
      width: 128,
      height: 128,
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: () => showModal(
            context: context,
            initAvatar: state.chart.avatar,
            initGender: state.chart.gender,
            ref: ref,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CircleHumanAvatar(
              gender: state.chart.gender.intValue,
              path: state.chart.avatar,
              size: 64.0,
            ),
          ),
        ),
      ),
    );
  }
}
