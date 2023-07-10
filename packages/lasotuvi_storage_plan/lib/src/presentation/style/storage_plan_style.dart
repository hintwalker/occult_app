import 'package:flutter/material.dart';

class StoragePlanStyle {
  Color get iconColor => Colors.black87;
  double get energyIconSize => 20.0;
  // Color get textColor => Colors.black87;
  // Color get infoBackgroundColor => Colors.white12;
  TextStyle get title => const TextStyle();
  TextStyle get price => const TextStyle();
  TextStyle get benifit => const TextStyle();
  TextStyle get period => const TextStyle();
  TextStyle get using => const TextStyle();
  TextStyle get nextPaymentTitle => const TextStyle();
  TextStyle get nextPaymentTime => const TextStyle();
  TextStyle get expiredTitle => const TextStyle();
  TextStyle get expiredTime => const TextStyle();
  TextStyle get expiredDuration => const TextStyle();
  TextStyle get canceledTitle => const TextStyle();
  TextStyle get canceledTime => const TextStyle();
  TextStyle get willCancelTitle => const TextStyle();
  TextStyle get willCancelDuration => const TextStyle();
  TextStyle get learnMore => const TextStyle();
  ButtonStyle get cancelButton => FilledButton.styleFrom();
  ButtonStyle get extendButton => FilledButton.styleFrom();
  ButtonStyle get registerButton => FilledButton.styleFrom();
}
