import 'package:flutter/material.dart';

import '../../../basic_autosize_text.dart';

class HouseLifeStarView extends StatelessWidget {
  const HouseLifeStarView(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return BasicAutoSizeText(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
    );
  }
}
