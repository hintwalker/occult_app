part of lasotuvi_presentation;

class Dashboard extends ConsumerWidget {
  const Dashboard({
    super.key,
    this.restorationId,
    required this.child,
  });
  final String? restorationId;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RestorationScope(
      restorationId: restorationId,
      child: Scaffold(
        body: DrawerScaffold(
            header: const DrawerHeader(),
            title: (id) => Text(getScreenTitle(id)),
            menus: menus,
            style: const DrawerStyleImpl(lightColorScheme),
            onMenuTap: (menu) => context.goNamed(menu),
            controller: ref.read(mainDrawerControllerProvider),
            appBarTrailing: const EnergyPointAppBarAction(),
            child: child),
      ),
    );
  }

  String getScreenTitle(String id) {
    switch (id) {
      case DrawerIds.home:
        return translate('home');
      case DrawerIds.charts:
        return translate('charts');
      case DrawerIds.energyMarket:
        return translate('energyMarket');
      case DrawerIds.library:
        return translate('library');
      case DrawerIds.notes:
        return translate('notes');
      case DrawerIds.tags:
        return translate('tags');
      case DrawerIds.storagePlanMarket:
        return translate('storagePlanMarket');
      default:
        return '';
    }
  }
}
