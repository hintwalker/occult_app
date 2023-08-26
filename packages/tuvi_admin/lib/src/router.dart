import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:tauari_ui/tauari_ui.dart';

// import 'screen/energy_market.dart';
import 'global_key.dart';
import 'screen/home.dart';

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
          pageBuilder: (context, state, child) => const MaterialPage(
              name: 'dashboard',
              restorationId: 'router.shell',
              child: HomeScreen(
                restorationId: 'dashboard',
                // drawerController: mainDrawerController,
                // child: Text('Dashboard'),
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
          ])
    ]);
