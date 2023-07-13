import 'package:flutter/material.dart';
import 'package:tauari_list_view/src/entity/sort_value.dart';

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
