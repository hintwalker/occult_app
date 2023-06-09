import 'package:flutter/material.dart';

import 'chart_avatar_input.dart';
import 'chart_gender_input.dart';
import 'chart_name_input.dart';

class ChartCreationStep1 extends StatelessWidget {
  const ChartCreationStep1({
    super.key,
    required this.colorScheme,
    required this.translate,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final double space = 18;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartAvatarInput(),
        ChartNameInput(
          translate: translate,
        ),
        SizedBox(
          height: space,
        ),
        ChartGenderInput(
          colorScheme: colorScheme,
          translate: translate,
        ),
        SizedBox(
          height: space,
        ),
      ],
    );
  }
}
