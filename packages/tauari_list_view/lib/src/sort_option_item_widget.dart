import 'package:flutter/material.dart';
import 'package:tauari_sort/tauari_sort.dart';

class SortOptionItemWidget extends StatelessWidget {
  const SortOptionItemWidget({
    super.key,
    required this.data,
    required this.colorScheme,
    required this.onTap,
  });
  final SortOption data;
  final ColorScheme colorScheme;
  final void Function(SortValue) onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: data.icon,
      title: Text(
        data.label,
        style: TextStyle(color: colorScheme.primary, fontSize: 16.0),
      ),
      onTap: () => onTap(data.value),
    );
  }
}
