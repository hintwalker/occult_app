import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../chart_creation_notifier.dart';
import '../controller/chart_name_controller.dart';
import '../controller/gender_controller.dart';
import 'chart_avatar_input.dart';
import 'chart_gender_input.dart';
import 'chart_name_input.dart';

class ChartCreationStep1 extends ConsumerWidget {
  const ChartCreationStep1({
    super.key,
    required this.colorScheme,
    required this.translate,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final double space = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ChartAvatarInput(
          translate: translate,
        ),
        ChartNameInput(
          translate: translate,
          controller: ChartNameController(
            value: translate('noName'),
            updateValid: (value) => ref
                .read(chartCreationNotifierProvider.notifier)
                .updateValid(value),
            updateValue: (value) => ref
                .read(chartCreationNotifierProvider.notifier)
                .updateName(value),
          ),
        ),
        SizedBox(
          height: space,
        ),
        ChartGenderInput(
            colorScheme: colorScheme,
            translate: translate,
            controller: GenderController(
              value: ref.read(chartCreationNotifierProvider).chart.gender,
              updateValid: (value) => ref
                  .read(chartCreationNotifierProvider.notifier)
                  .updateValid(value),
              updateValue: (value) => ref
                  .read(chartCreationNotifierProvider.notifier)
                  .updateGender(value),
            )),
        SizedBox(
          height: space,
        ),
      ],
    );
  }
}
