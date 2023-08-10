import 'package:flutter/material.dart';

class SubscriptionConfirmStyle {
  const SubscriptionConfirmStyle({
    this.planTitle,
    this.planPrice,
    this.propertyName,
    this.propertyValue,
    this.propertyValueDanger,
    this.cancelPlanIconColor,
    this.nextPlanIconColor,
    this.overlayColor,
  });
  final TextStyle? planTitle;
  final TextStyle? planPrice;
  final TextStyle? propertyName;
  final TextStyle? propertyValue;
  final TextStyle? propertyValueDanger;
  final Color? cancelPlanIconColor;
  final Color? nextPlanIconColor;
  final Color? overlayColor;
}
