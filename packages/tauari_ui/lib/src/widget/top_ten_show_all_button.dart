import 'package:flutter/material.dart';

class TopTenShowAllButton extends StatelessWidget {
  const TopTenShowAllButton(
    this.text, {
    super.key,
    required this.onTap,
    required this.colorScheme,
  });
  final void Function() onTap;
  final String text;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: Text(text),
      label: const Icon(Icons.arrow_forward_ios),
    );
  }
}
