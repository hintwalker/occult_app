import 'package:flutter/material.dart';

import 'item_text_style.dart';

class HumanName extends StatelessWidget {
  const HumanName(
    this.name, {
    super.key,
    required this.colorScheme,
  });
  final String name;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: itemTextStyle.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: colorScheme.primary,
      ),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}
