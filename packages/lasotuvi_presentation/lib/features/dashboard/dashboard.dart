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
            title: (id) => const Text('home'),
            menus: menus,
            style: DrawerStyleImpl(Theme.of(context).colorScheme),
            onMenuTap: (menu) => context.goNamed(menu),
            controller: ref.read(mainDrawerControllerProvider),
            child: child),
      ),
    );
  }
}
