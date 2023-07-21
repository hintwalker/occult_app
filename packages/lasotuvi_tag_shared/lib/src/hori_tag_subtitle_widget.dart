import 'package:flutter/material.dart';

class HoriTagSubTitleWidget extends StatelessWidget {
  const HoriTagSubTitleWidget(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
          overflow: TextOverflow.fade,
          maxLines: 2,
        ));
  }
}
