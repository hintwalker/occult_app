import 'package:energy_store/energy_store.dart';
import 'package:flutter/material.dart';
import 'package:tuvi_style/tuvi_style.dart';

class LiveEnergyStyleImpl implements LiveEnergyStyle {
  @override
  Color get iconColor => lightColorScheme.primary;

  @override
  TextStyle get textStyle => TextStyle(
      color: lightColorScheme.primary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.2);
}
