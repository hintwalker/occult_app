part of lasotuvi_presentation;

class StoragePlanStyleImpl extends StoragePlanStyle {
  @override
  Color get iconColor => lightColorScheme.secondary;

  @override
  double get energyIconSize => 34.0;

  @override
  TextStyle get title => TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: lightColorScheme.primary);

  @override
  TextStyle get price => TextStyle(
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
        color: lightColorScheme.primary,
      );
  @override
  TextStyle get benifit => TextStyle(
        fontSize: 16.0,
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
