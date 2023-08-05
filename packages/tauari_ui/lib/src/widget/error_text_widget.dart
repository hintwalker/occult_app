import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  const ErrorTextWidget({
    super.key,
    this.message,
    this.textColor,
  });
  final String? message;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: message == null
          ? const Text('!')
          : Text(
              message!,
              style: TextStyle(
                fontSize: 14,
                color: textColor ?? Colors.deepOrangeAccent.shade700,
                letterSpacing: 1.2,
              ),
            ),
    );
  }
}
