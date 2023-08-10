import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tuvi_style/tuvi_style.dart';

class StoragePlanStyleImpl extends StoragePlanStyle {
  @override
  Color get primary => lightColorScheme.primary;
  @override
  Color get outline => lightColorScheme.outline;
  @override
  Color get iconColor => lightColorScheme.secondary;

  @override
  Color get activedRibbonBackground => lightColorScheme.tertiaryContainer;
  @override
  Color get activedRibbonTextColor => lightColorScheme.onTertiaryContainer;

  @override
  double get energyIconSize => 34.0;

  @override
  TextStyle get title => TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: lightColorScheme.primary);

  @override
  TextStyle get price => TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: lightColorScheme.primary,
      );
  @override
  TextStyle get benifit => TextStyle(
        fontSize: 18.0,
        color: lightColorScheme.secondary,
      );

  @override
  TextStyle get period =>
      TextStyle(fontSize: 18.0, color: lightColorScheme.primary);

  @override
  TextStyle get using => TextStyle(
        fontSize: 18.0,
        color: lightColorScheme.tertiary,
        fontStyle: FontStyle.italic,
      );

  @override
  TextStyle get nextPaymentTitle => TextStyle(
        fontSize: 14.0,
        color: lightColorScheme.tertiary,
        fontStyle: FontStyle.italic,
      );

  @override
  TextStyle get nextPaymentTime => TextStyle(
        fontSize: 14.0,
        color: lightColorScheme.tertiary,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get expiredTitle => TextStyle(
        fontSize: 14.0,
        color: lightColorScheme.tertiary,
        fontStyle: FontStyle.italic,
      );

  @override
  TextStyle get expiredTime => TextStyle(
        fontSize: 14.0,
        color: lightColorScheme.tertiary,
        fontStyle: FontStyle.italic,
      );

  @override
  TextStyle get willCancelTitle => TextStyle(
        fontSize: 14.0,
        color: lightColorScheme.error,
        fontStyle: FontStyle.italic,
      );

  @override
  TextStyle get willCancelDuration => TextStyle(
        fontSize: 14.0,
        color: lightColorScheme.error,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get canceledTitle => TextStyle(
        fontSize: 14.0,
        color: lightColorScheme.error,
        fontStyle: FontStyle.italic,
      );

  @override
  TextStyle get canceledTime => TextStyle(
      fontSize: 14.0,
      color: lightColorScheme.error,
      fontStyle: FontStyle.italic);

  @override
  TextStyle get learnMore => TextStyle(
        fontSize: 14.0,
        color: lightColorScheme.tertiary,
        fontStyle: FontStyle.italic,
      );

  @override
  ButtonStyle get cancelButton => FilledButton.styleFrom();

  @override
  ButtonStyle get extendButton => FilledButton.styleFrom(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary);
  @override
  ButtonStyle get registerButton => FilledButton.styleFrom(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary);
}
