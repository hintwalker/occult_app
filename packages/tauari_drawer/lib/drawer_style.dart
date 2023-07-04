part of tauari_drawer;

abstract class DrawerStyle {
  const DrawerStyle();
  Color get backgroundColor; // lightColorScheme.background;
  Color get dividerColor; // lightColorScheme.secondary.withOpacity(0.2);
  Color get menuIconColor; // lightColorScheme.outline;
  Color get boxShadowColor; // lightColorScheme.outline;
  double get shadowBlurRadius; // 24.0;
  Color get itemHeaderColor; // darkColorScheme.onTertiary;

  Color get selectedIconColor; // lightColorScheme.onPrimaryContainer;

  Color get iconColor; // lightColorScheme.outline;

  Color
      get itemHighlightColor; // lightColorScheme.primaryContainer.withOpacity(0.5);
  double get itemFontSize; // 16.0;

  FontWeight get itemFontWeight; // FontWeight.w500;

  double get minHeaderHeight;

  Color get appBarColor; // 100;
}
