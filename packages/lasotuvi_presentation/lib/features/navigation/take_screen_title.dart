part of lasotuvi_presentation;

Widget takeScreenTitle(String screenId) {
  switch (screenId) {
    case DrawerIds.home:
      return Text(translate('home'));
    case DrawerIds.energyMarket:
      return Text(translate('energyMarket'));
    default:
      return const Text('');
  }
}
