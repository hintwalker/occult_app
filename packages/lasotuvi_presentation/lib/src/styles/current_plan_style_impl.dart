import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

class CurrentPlanStyleImpl {
  static CurrentPlanStyle apply(ColorScheme colorScheme) {
    return CurrentPlanStyle(
      iconColor: colorScheme.secondary,
      iconSize: 24.0,
      titleStyle: TextStyle(fontSize: 18.0, color: colorScheme.secondary),
      energyIconColor: colorScheme.primary,
      energyIconSize: 24.0,
      planInfoBackground: colorScheme.tertiaryContainer.withOpacity(0.3),
      planNameStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: colorScheme.secondary,
      ),
      priceStyle: TextStyle(
        fontSize: 16.0,
        color: colorScheme.primary,
      ),
      expiredDate: TextStyle(
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
        color: colorScheme.secondary,
      ),
      expiredText: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: colorScheme.error,
        letterSpacing: 1.2,
      ),
      deleteDataWarning: TextStyle(
        fontSize: 14.0,
        fontStyle: FontStyle.italic,
        color: colorScheme.error,
      ),
    );
  }
}
