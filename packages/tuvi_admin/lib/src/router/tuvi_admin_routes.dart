import 'package:go_router/go_router.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_admin_presentation/tuvi_admin_presentation.dart';

import '../screen/dashboard.dart';

class TuviAdminRoutes {
  static final routes = [
    GoRoute(
      name: RouteName.dashboard,
      path: RoutePath.dashboard,
      pageBuilder: (context, state) => const FadeTransitionPage(
          child: DashboardScreen(
        restorationId: RouteName.dashboard,
        // drawerController: mainDrawerController,
      )),
    ),
  ];
}
