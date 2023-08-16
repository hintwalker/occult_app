import 'package:flutter/material.dart';

class CurrentPlanStyle {
  final TextStyle? expiredText;

  const CurrentPlanStyle({
    this.iconColor,
    this.energyIconColor,
    this.energyIconSize,
    this.iconSize,
    this.planInfoBackground,
    this.planNameStyle,
    this.priceStyle,
    this.titleStyle,
    this.expiredDate,
    this.expiredText,
    this.deleteDataWarning,
  });
  final Color? iconColor;
  final double? iconSize;
  final TextStyle? titleStyle;
  final TextStyle? planNameStyle;
  final TextStyle? priceStyle;
  final Color? energyIconColor;
  final double? energyIconSize;
  final Color? planInfoBackground;
  final TextStyle? expiredDate;
  final TextStyle? deleteDataWarning;
}
