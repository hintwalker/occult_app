import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_button/group_button.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../chart_creation_notifier.dart';
import '../controller/gender_controller.dart';

class ChartGenderInput extends ConsumerWidget {
  ChartGenderInput({
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.controller,
  });
  final GenderController controller;
  final groupButtonController = GroupButtonController();
  final ColorScheme colorScheme;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      groupButtonController.selectIndex(controller.value.index);
      // ref.read(chartCreationNotifierProvider).chart.gender.index);
    });
    ref.listen(chartCreationNotifierProvider, (prev, next) {
      if (prev != next) {
        groupButtonController.selectIndex(next.chart.gender.index);
      }
    });
    return GroupButton(
      controller: groupButtonController,
      isRadio: true,
      // onSelected: (value, index, isSelected) {
      //   ref.read(chartCreationNotifierProvider.notifier).updateGender(value);
      // },
      buttons: const [
        Gender.female,
        Gender.male,
      ],
      buttonBuilder: (selected, value, context) => selected
          ? ElevatedButton(
              onPressed: () {
                controller.onChanged(value, true);

                // ref
                //     .read(chartCreationNotifierProvider.notifier)
                //     .updateGender(value);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primaryContainer),
              child: Text(
                translate(value.name),
                style: TextStyle(color: colorScheme.onPrimaryContainer),
              ),
            )
          : TextButton(
              onPressed: () {
                controller.onChanged(value, true);
                // ref
                //     .read(chartCreationNotifierProvider.notifier)
                //     .updateGender(value);
              },
              child: Text(translate(value.name))),
      // options: GroupButtonOptions(borderRadius: BorderRadius.circular(24)),
    );
  }
}
