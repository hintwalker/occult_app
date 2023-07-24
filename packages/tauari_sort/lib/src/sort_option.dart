import 'package:flutter/material.dart';
import 'package:tauari_sort/src/sort_value.dart';

class SortOption {
  const SortOption({
    required this.icon,
    required this.label,
    required this.value,
  });

  final Widget? icon;
  final String label;
  final SortValue value;
}
