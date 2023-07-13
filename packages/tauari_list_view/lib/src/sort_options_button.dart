import 'package:flutter/material.dart';

class SortOptionsButton extends StatelessWidget {
  const SortOptionsButton({
    super.key,
    required this.colorScheme,
    required this.onTap,
  });
  final ColorScheme colorScheme;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.sort,
        color: colorScheme.primary,
      ),
    );
  }
}
