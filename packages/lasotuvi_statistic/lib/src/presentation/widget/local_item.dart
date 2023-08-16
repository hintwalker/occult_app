import 'package:flutter/material.dart';

class LocalItem extends StatelessWidget {
  const LocalItem({
    super.key,
    required this.title,
    required this.value,
    required this.colorScheme,
    this.leading,
  });
  final String title;
  final int value;
  final ColorScheme colorScheme;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20.0,
          ),
          if (leading != null) leading!,
          const SizedBox(
            width: 8.0,
          ),
          Text(
            '$title:',
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            '$value',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}
