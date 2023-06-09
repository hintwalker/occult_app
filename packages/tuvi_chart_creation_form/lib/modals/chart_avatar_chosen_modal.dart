import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tauari_ui/tauari_ui.dart';
// import 'package:tuvi_chart_avatar/tuvi_chart_avatar.dart' show ChartAvatar;
import '../chart_creation_notifier.dart';

class ChartAvatarChosenModal extends ConsumerWidget {
  final imagePicker = ImagePicker();

  ChartAvatarChosenModal({super.key});

  void pickImage(BuildContext context, WidgetRef ref) async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    ref.read(chartCreationNotifierProvider.notifier).updateAvatar(image?.path);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chart = ref.watch(chartCreationNotifierProvider);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () => pickImage(context, ref),
              child: Card(
                child: CircleHumanAvatar(
                  gender: chart.gender.intValue,
                  path: chart.avatar,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          ElevatedButton(
              onPressed: () {
                ref
                    .read(chartCreationNotifierProvider.notifier)
                    .updateAvatar(null);
              },
              child: const Text('Mac dinh')),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
