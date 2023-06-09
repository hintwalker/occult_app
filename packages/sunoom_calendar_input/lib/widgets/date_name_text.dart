import 'package:flutter/material.dart';

class DateNameText extends StatelessWidget {
  const DateNameText(
    this.data, {
    super.key,
    required this.align,
    this.translate,
  });
  final String? data;
  final TextAlign align;
  final String Function(String)? translate;

  @override
  Widget build(BuildContext context) {
    return Text(
      data == null
          ? '-'
          : translate == null
              ? data!
              : translate!(data!),
      style: const TextStyle(fontStyle: FontStyle.italic),
      textAlign: align,
    );
  }
}
