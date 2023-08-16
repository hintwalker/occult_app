import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

class SubscriptionConfirmStyleImpl {
  static SubscriptionConfirmStyle apply(ColorScheme colorScheme) {
    return SubscriptionConfirmStyle(
      planTitle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorScheme.secondary),
      planPrice: TextStyle(fontSize: 18, color: colorScheme.primary),
      propertyName: TextStyle(fontSize: 16, color: colorScheme.secondary),
      propertyValue: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colorScheme.primary),
      propertyIconSize: 14,
      propertyValueDanger: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: colorScheme.error),
      cancelPlanIconColor: colorScheme.outline,
      nextPlanIconColor: colorScheme.tertiary,
      overlayColor: colorScheme.outline.withOpacity(0.5),
      energyIconColor: colorScheme.primary,
      energyIconSize: 14,
      billingBackgroundColor: colorScheme.primaryContainer,
      billingTitleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: colorScheme.onPrimaryContainer,
      ),
      billingValueTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: colorScheme.primary,
      ),
    );
  }
}
