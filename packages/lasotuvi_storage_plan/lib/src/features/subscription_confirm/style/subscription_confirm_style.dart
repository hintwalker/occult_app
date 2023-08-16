import 'package:flutter/material.dart';

class SubscriptionConfirmStyle {
  final double? energyIconSize;
  final double? propertyIconSize;
  const SubscriptionConfirmStyle({
    this.planTitle,
    this.planPrice,
    this.propertyName,
    this.propertyValue,
    this.propertyValueDanger,
    this.cancelPlanIconColor,
    this.nextPlanIconColor,
    this.overlayColor,
    this.energyIconColor,
    this.billingTitleTextStyle,
    this.billingValueTextStyle,
    this.billingBackgroundColor,
    this.energyIconSize,
    this.propertyIconSize,
  });
  final TextStyle? planTitle;
  final TextStyle? planPrice;
  final TextStyle? propertyName;
  final TextStyle? propertyValue;
  final TextStyle? propertyValueDanger;
  final Color? cancelPlanIconColor;
  final Color? nextPlanIconColor;
  final Color? overlayColor;
  final Color? energyIconColor;
  final TextStyle? billingTitleTextStyle;
  final TextStyle? billingValueTextStyle;
  final Color? billingBackgroundColor;
}
