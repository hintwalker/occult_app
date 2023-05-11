import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'lasotuvi_routes.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show routerNotifierProvider, RoutePath;

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
final routerProvider = Provider.autoDispose<GoRouter>((ref) {
  final sub = ref.listen(routerNotifierProvider, (_, __) {});
  ref.onDispose(sub.close);
  final notifier = ref.read(routerNotifierProvider.notifier);
  return GoRouter(
    navigatorKey: _key,
    refreshListenable: notifier,
    debugLogDiagnostics: true,
    initialLocation: RoutePath.dashboard,
    routes: LasotuviRoutes.routes,
    redirect: notifier.redirect,
  );
});
