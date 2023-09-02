import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:tuvi_admin_presentation/tuvi_admin_presentation.dart';

import '../global_key.dart';
import 'tuvi_admin_routes.dart';

// final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
final tuviAdminRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  final sub = ref.listen(routerNotifierProvider, (_, __) {});
  ref.onDispose(sub.close);
  final notifier = ref.read(routerNotifierProvider.notifier);
  return GoRouter(
    restorationScopeId: 'root',
    navigatorKey: rootNavigatorKey,
    refreshListenable: notifier,
    debugLogDiagnostics: true,
    initialLocation: RoutePath.dashboard,
    routes: TuviAdminRoutes.routes,
    redirect: notifier.redirect,
  );
});
