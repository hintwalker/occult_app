part of 'main.dart';

final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    restorationScopeId: 'route',
    initialLocation: '/home',
    redirect: (context, state) {
      if (state.path == '/') {
        return '/home';
      }
      return null;
    },
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
          navigatorKey: shellNavigatorKey,
          pageBuilder: (context, state, child) => MaterialPage(
              restorationId: 'router.shell',
              child: Dashboard(
                restorationId: 'dashboard',
                // drawerController: mainDrawerController,
                child: child,
              )),
          routes: [
            GoRoute(
              name: 'home',
              path: '/home',
              pageBuilder: (context, state) => const FadeTransitionPage(
                  child: HomeScreen(
                restorationId: 'home',
                // drawerController: mainDrawerController,
              )),
            ),
            GoRoute(
                name: 'energyMarket',
                path: '/energyMarket',
                pageBuilder: (context, state) => const FadeTransitionPage(
                      child: EnergyMarketScreen(
                        restorationId: 'energyMarket',
                        // drawerController: mainDrawerController,
                      ),
                    ))
          ])
    ]);
