part of lasotuvi_presentation;

class MainNavigation extends StatelessWidget {
  const MainNavigation({
    super.key,
    required this.screen,
  });
  final Widget Function(String drawerId) screen;

  @override
  Widget build(BuildContext context) {
    return DrawerWidget(
      header: const DrawerHeader(),
      screen: screen,
      title: takeScreenTitle,
      menus: menus,
      style: const DrawerStyleImpl(lightColorScheme),
      appBarTrailing: const AppBarTrailing(),
    );
  }
}
