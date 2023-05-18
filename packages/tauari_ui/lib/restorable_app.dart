part of tauari_ui;

class RestorableApp extends ConsumerStatefulWidget {
  const RestorableApp({
    super.key,
    required this.title,
    required this.theme,
  });
  final String title;
  final ThemeData theme;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RestorableAppState();
}

class _RestorableAppState extends ConsumerState<RestorableApp>
    with RestorationMixin {
  // final RestorableAppState appState = RestorableAppState();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      restorationScopeId: 'app',
      routerConfig: ref.read(routerProvider),
      theme: widget.theme,
      title: widget.title,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
    );
  }

  @override
  String? get restorationId => 'wrapper';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(ref.read(restorableStateProvider.notifier), 'state');
  }

  @override
  void dispose() {
    ref.read(restorableStateProvider.notifier).dispose();
    super.dispose();
  }
}
