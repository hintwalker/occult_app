import 'package:flutter/material.dart';

class ChartCardStyle {
  const ChartCardStyle({
    this.onlyCloudIconColor,
    this.birthdayGregorian,
    this.birthdayLuniSolar,
    this.name,
    this.onlyLocalIconColor,
    this.syncedIconColor,
    this.watchingYear,
    this.width = 120.0,
  });
  final Color? onlyCloudIconColor;
  final Color? onlyLocalIconColor;
  final Color? syncedIconColor;
  final TextStyle? birthdayGregorian;
  final TextStyle? birthdayLuniSolar;
  final TextStyle? watchingYear;
  final TextStyle? name;
  final double width;
}
