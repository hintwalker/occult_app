part of lasotuvi_presentation;

Widget takeScreenTitle(String screenId) {
  switch (screenId) {
    case DrawerIds.home:
      return Text(translate('home'));
    default:
      return const Text('');
  }
}
