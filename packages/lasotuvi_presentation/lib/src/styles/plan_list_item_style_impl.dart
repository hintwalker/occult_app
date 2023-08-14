import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

class PlanListItemStyleImpl {
  static PlanListItemStyle apply(ColorScheme colorScheme) => PlanListItemStyle(
        title: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: colorScheme.secondary,
        ),
        priceValue: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: colorScheme.primary,
        ),
        pricePeriod: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: colorScheme.secondary,
        ),
        energyIconColor: colorScheme.primary,
        energyIconSize: 28,
        benifit: TextStyle(fontSize: 20, color: colorScheme.tertiary),
        propertyIconColor: colorScheme.outline,
        activedSignalBackground: colorScheme.tertiaryContainer,
        activedSignalTextStyle: TextStyle(
          fontSize: 20,
          color: colorScheme.onTertiaryContainer,
        ),
        activedSinalBorderColor: colorScheme.tertiaryContainer,
      );
}
