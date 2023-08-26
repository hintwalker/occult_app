import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tauari_local_file/tauari_local_file.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../controller/chart_avatar_controller.dart';

class ChartAvatarChosenWidget extends ConsumerStatefulWidget {
  ChartAvatarChosenWidget({
    super.key,
    required this.controller,
    required this.translate,
    required this.chartId,
  });
  final ChartAvatarController controller;
  final String Function(String) translate;
  final String chartId;
  final imagePicker = ImagePicker();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChartAvatarChosenState();
}

class _ChartAvatarChosenState extends ConsumerState<ChartAvatarChosenWidget> {
  String? avatar;
  @override
  void initState() {
    super.initState();
    updateAvatar();
  }

  void pickImage(
      BuildContext context, WidgetRef ref, Function() callback) async {
    final image =
        await widget.imagePicker.pickImage(source: ImageSource.gallery);
    String? path = image?.path;
    if (image != null) {
      final parentPath = await tempPath();
      path = '$parentPath/${widget.chartId}';
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
      await image.saveTo(path);
      final pickedFile = File(image.path);
      await pickedFile.delete();
    }

    widget.controller.onChanged(widget.chartId, true);
    callback();
    // ref.read(chartCreationNotifierProvider.notifier).updateAvatar(image?.path);
  }

  void updateAvatar() {
    setState(() {
      imageCache.clear();
      imageCache.clearLiveImages();
      avatar = widget.controller.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child:
              // InkWell(
              //   borderRadius: BorderRadius.circular(18),
              //   onTap: () => pickImage(context, ref),
              //   child: Card(
              //     child:
              CircleHumanAvatar(
            gender: widget.controller.initGender.intValue,
            path: avatar,
          ),
          //   ),
          // ),
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  widget.controller.onChanged('', true);
                  updateAvatar();
                  // ref
                  //     .read(chartCreationNotifierProvider.notifier)
                  //     .updateAvatar('');
                },
                child: Text(widget.translate('default'))),
            ElevatedButton(
              onPressed: () => pickImage(context, ref, updateAvatar),
              child: Text(
                widget.translate(
                  'browse...',
                ),
              ),
            ),
          ],
        ),

        // const SizedBox(
        //   height: 24,
        // ),
      ],
    );
  }
}
