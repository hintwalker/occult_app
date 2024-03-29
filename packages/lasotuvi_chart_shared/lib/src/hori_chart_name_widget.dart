import 'package:flutter/material.dart';

class HoriChartNameWidget extends StatelessWidget {
  const HoriChartNameWidget(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.bold, letterSpacing: 1.2),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
