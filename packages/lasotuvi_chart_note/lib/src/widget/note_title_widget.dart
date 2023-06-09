import 'package:flutter/material.dart';

class NoteTitleWidget extends StatelessWidget {
  const NoteTitleWidget(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 44.0, right: 8.0, bottom: 8.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            letterSpacing: 1.2,
            fontWeight: FontWeight.w500,
          ),
          overflow: TextOverflow.fade,
          maxLines: 2,
        ));
  }
}
