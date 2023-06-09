import 'package:flutter/material.dart';

import 'chart_birthday_input.dart';

class ChartCreationStep2 extends StatelessWidget {
  const ChartCreationStep2({
    super.key,
    required this.colorScheme,
    required this.translate,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartBirthdayInput(
          colorScheme: colorScheme,
          translate: translate,
        ),
        const SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
