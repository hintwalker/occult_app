import 'package:flutter/material.dart';

class HumanItemTitle extends StatelessWidget {
  const HumanItemTitle(this.title, {super.key, required this.translate});
  final String Function(String) translate;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      translate(title),
      style: const TextStyle(
        fontSize: 12,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
