import 'package:flutter/material.dart';

import '../../../basic_autosize_text.dart';

class HouseNameView extends StatelessWidget {
  const HouseNameView(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return BasicAutoSizeText(
      text,
      upperCase: true,
      style: const TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
