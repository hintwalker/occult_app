import 'package:flutter/material.dart';

class SimpleErrorWidget extends StatelessWidget {
  const SimpleErrorWidget({
    super.key,
    this.message,
    this.style,
  });
  final String? message;
  final ErrorStyle? style;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: style == null ? Colors.red.shade100 : style!.background),
      padding: const EdgeInsets.all(12.0),
      child: message == null
          ? Text(
              '!',
              style: TextStyle(
                  color: style == null ? Colors.red : style!.textColor),
            )
          : Column(children: [
              Text('!',
                  style: TextStyle(
                      color: style == null ? Colors.red : style!.textColor)),
              const SizedBox(
                height: 18.0,
              ),
              Text(message!,
                  style: TextStyle(
                      color: style == null ? Colors.red : style!.textColor)),
            ]),
    );
  }
}

abstract class ErrorStyle {
  Color get background;
  Color get textColor;
}
