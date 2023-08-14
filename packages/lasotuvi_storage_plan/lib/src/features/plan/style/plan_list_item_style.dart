import 'package:flutter/material.dart';

class PlanListItemStyle {
  final TextStyle? title;
  final TextStyle? priceValue;
  final TextStyle? pricePeriod;

  final double? energyIconSize;
  final Color? energyIconColor;

  final Color? propertyIconColor;

  final TextStyle? benifit;

  const PlanListItemStyle({
    this.title,
    this.pricePeriod,
    this.priceValue,
    this.energyIconSize,
    this.energyIconColor,
    this.benifit,
    this.propertyIconColor,
    this.activedSignalBackground,
    this.activedSignalTextStyle,
    this.activedSinalBorderColor,
  });
  final Color? activedSignalBackground;
  final TextStyle? activedSignalTextStyle;
  final Color? activedSinalBorderColor;
}
