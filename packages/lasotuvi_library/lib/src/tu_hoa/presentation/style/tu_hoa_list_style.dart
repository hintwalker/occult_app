import 'package:flutter/material.dart';

class TuHoaListStyle {
  final Color? selectedColor;

  final Color chipBorderColor;

  final Color? chipBackgroundColor;

  const TuHoaListStyle({
    this.highlightColor,
    this.canColor,
    this.selectedColor,
    this.hoaLabel,
    this.selectedHoaLabel,
    required this.chipBorderColor,
    this.chipBackgroundColor,
  });
  final Color? highlightColor;
  final Color? canColor;
  final Color? hoaLabel;
  final Color? selectedHoaLabel;
}
