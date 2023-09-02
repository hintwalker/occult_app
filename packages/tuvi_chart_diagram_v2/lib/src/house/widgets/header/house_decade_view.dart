import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class HouseDecadeView extends StatelessWidget {
  const HouseDecadeView(this.data, {super.key, required this.translate});
  final int data;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      '$data',
      style: const TextStyle(fontSize: 8, fontWeight: FontWeight.w600),
      minFontSize: 7,
      maxFontSize: 9,
    );
  }
}
