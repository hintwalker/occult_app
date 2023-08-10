import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

class SubscriptionConfirmStyleImpl {
  static SubscriptionConfirmStyle apply(ColorScheme colorScheme) {
    return SubscriptionConfirmStyle(
      planTitle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorScheme.secondary),
      planPrice: TextStyle(fontSize: 24, color: colorScheme.primary),
      propertyName: TextStyle(fontSize: 18, color: colorScheme.secondary),
      propertyValue: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: colorScheme.primary),
      propertyValueDanger: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: colorScheme.error),
      cancelPlanIconColor: colorScheme.outline,
      nextPlanIconColor: colorScheme.tertiary,
      overlayColor: colorScheme.outline.withOpacity(0.5),
    );
  }
}
