import 'package:flutter/material.dart';

class HoriRequestNameWidget extends StatelessWidget {
  const HoriRequestNameWidget(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 1.2),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
