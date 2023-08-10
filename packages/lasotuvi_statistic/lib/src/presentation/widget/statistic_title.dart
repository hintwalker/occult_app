import 'package:flutter/material.dart';

class StatisticTitle extends StatelessWidget {
  const StatisticTitle({
    super.key,
    required this.title,
    required this.colorScheme,
    this.leading,
  });
  final Widget? leading;
  final String title;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(title,
          style: TextStyle(
            fontSize: 24,
            color: colorScheme.primary,
          )),
    );
  }
}
