import 'package:flutter/material.dart';

import '../../../basic_autosize_text.dart';

class HouseYearView extends StatelessWidget {
  const HouseYearView(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return BasicAutoSizeText(
      text,
      style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
    );
  }
}
