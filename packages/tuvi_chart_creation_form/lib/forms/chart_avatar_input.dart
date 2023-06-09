import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tauari_ui/tauari_ui.dart';
// import 'package:tuvi_chart_avatar/chart_avatar.dart';

import '../chart_creation_notifier.dart';
import '../modals/chart_avatar_chosen_modal.dart';

class ChartAvatarInput extends ConsumerWidget {
  ChartAvatarInput({super.key});
  final imagePicker = ImagePicker();

  void showModal(BuildContext context) async {
    await showModalBottomSheet(
        context: context, builder: (ctx) => ChartAvatarChosenModal());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chart = ref.watch(chartCreationNotifierProvider);
    return SizedBox(
      width: 64,
      height: 64,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => showModal(context),
        child: Card(
          child: CircleHumanAvatar(
            gender: chart.gender.intValue,
            path: chart.avatar,
          ),
        ),
      ),
    );
  }
}
