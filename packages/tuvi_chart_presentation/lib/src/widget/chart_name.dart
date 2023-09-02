import 'package:flutter/material.dart';

class ChartName extends StatelessWidget {
  const ChartName(
    this.text, {
    super.key,
    this.style = const TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.bold, letterSpacing: 1.2),
  });
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
