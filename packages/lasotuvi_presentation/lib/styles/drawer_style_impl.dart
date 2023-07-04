part of lasotuvi_presentation;

class DrawerStyleImpl implements DrawerStyle {
  const DrawerStyleImpl(this.colorScheme);
  final ColorScheme colorScheme;
  @override
  Color get backgroundColor => colorScheme.background;

  @override
  Color get boxShadowColor => colorScheme.outline;

  @override
  Color get dividerColor => colorScheme.secondary.withOpacity(0.2);

  @override
  Color get iconColor => colorScheme.outline;

  @override
  double get itemFontSize => 16.0;

  @override
  FontWeight get itemFontWeight => FontWeight.w500;

  @override
  Color get itemHeaderColor => colorScheme.tertiary;

  @override
  Color get itemHighlightColor => colorScheme.primaryContainer.withOpacity(0.5);

  @override
  Color get menuIconColor => colorScheme.outline;

  @override
  double get minHeaderHeight => 100.0;

  @override
  Color get selectedIconColor => colorScheme.onPrimaryContainer;

  @override
  double get shadowBlurRadius => 24.0;

  @override
  Color get appBarColor => colorScheme.background;
}
