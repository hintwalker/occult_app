import 'package:flutter/material.dart';

class TimerTitleWidget extends StatelessWidget {
  const TimerTitleWidget(
    this.text, {
    super.key,
    required this.style,
  });
  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: style,
        ),
      ],
    );
  }
}
