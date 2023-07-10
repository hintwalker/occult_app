import 'package:flutter/material.dart';

class TopTenAddDataButton extends StatelessWidget {
  const TopTenAddDataButton({
    super.key,
    required this.onTap,
    required this.colorScheme,
  });
  final void Function() onTap;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.add_circle_outline,
        color: colorScheme.primary,
      ),
    );
  }
}
