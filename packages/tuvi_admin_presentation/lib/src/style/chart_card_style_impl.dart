import 'package:flutter/material.dart';
import 'package:tuvi_chart_presentation/tuvi_chart_presentation.dart';

class ChartCardStyleImpl {
  static ChartCardStyle apply(ColorScheme colorScheme) {
    return ChartCardStyle(
      name: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
        color: colorScheme.primary,
      ),
      birthdayGregorian: const TextStyle(fontSize: 14.0, letterSpacing: 1.2),
      birthdayLuniSolar: const TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
      ),
      watchingYear: const TextStyle(fontSize: 12, letterSpacing: 1.2),
      width: 140.0,
      onlyCloudIconColor: colorScheme.outlineVariant,
    );
  }
}
