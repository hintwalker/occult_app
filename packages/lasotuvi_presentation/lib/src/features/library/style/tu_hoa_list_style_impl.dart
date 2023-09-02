import 'package:flutter/material.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';

class TuHoaListStyleImpl {
  static TuHoaListStyle apply(ColorScheme colorScheme) {
    return TuHoaListStyle(
      highlightColor: colorScheme.primaryContainer.withOpacity(0.5),
      canColor: colorScheme.primary,
      selectedColor: colorScheme.tertiaryContainer,
      hoaLabel: colorScheme.outline,
      selectedHoaLabel: colorScheme.onTertiaryContainer,
      chipBorderColor: colorScheme.outline,
      chipBackgroundColor: colorScheme.background,
    );
  }
}
