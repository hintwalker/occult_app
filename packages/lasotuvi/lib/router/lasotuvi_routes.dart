import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:lasotuvi/screen/take_screen.dart';
// import 'package:lasotuvi/screen/chart/all_charts_screen.dart';
// import 'package:lasotuvi/screen/chart/chart_creation_screen.dart';
// import 'package:lasotuvi/screen/chart/chart_view_screen.dart';
// import 'package:lasotuvi/screen/get_screen.dart';
// import 'package:lasotuvi/screen/home/home_screen.dart';
// import 'package:lasotuvi/screen/tag/checkbox_tag_list_screen.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show Dashboard, RouteName, RoutePath, shellNavigatorKey;
import 'package:tauari_ui/tauari_ui.dart';

import '../screen/energy_market.dart';
import '../screen/home.dart';
// import '../screen/storage_plan_market_screen.dart';
// SplashScreen,
// WelcomeScreen,
// VerifyUserScreen;

// import '../screen/chart/all_charts_with_drawer_screen.dart';
// import '../screen/chart/chart_selection_screen.dart';
// import '../screen/market/market_screen.dart';
// import '../screen/note/all_notes_screen.dart';
// import '../screen/note/note_editor_screen.dart';
// import '../screen/tag/all_tags_screen.dart';
// import '../screen/tag/tag_creation_screen.dart';
// import '../screen/tag/tag_view_screen.dart';

class LasotuviRoutes {
  static final routes = [
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
            name: RouteName.home,
            path: RoutePath.home,
            pageBuilder: (context, state) => const FadeTransitionPage(
                child: HomeScreen(
              restorationId: 'home',
              // drawerController: mainDrawerController,
            )),
          ),
          GoRoute(
              name: RouteName.energyMarket,
              path: RoutePath.energyMarket,
              pageBuilder: (context, state) => const FadeTransitionPage(
                    child: EnergyMarketScreen(
                      restorationId: 'energyMarket',
                      // drawerController: mainDrawerController,
                    ),
                  ))
        ])
  ];
  // static final routes = [
  //   // GoRoute(
  //   //   path: RoutePath.splash,
  //   //   name: RouteName.splash,
  //   //   builder: ((context, state) => const SplashScreen()),
  //   // ),
  //   // GoRoute(
  //   //   path: RoutePath.welcome,
  //   //   name: RouteName.welcome,
  //   //   builder: ((context, state) => const WelcomeScreen()),
  //   // ),
  //   // GoRoute(
  //   //   path: RoutePath.verifyUser,
  //   //   name: RouteName.verifyUser,
  //   //   builder: ((context, state) => const VerifyUserScreen()),
  //   // ),
  //   GoRoute(
  //     path: RoutePath.dashboard,
  //     name: RouteName.dashboard,
  //     builder: ((context, state) => const DashboardScreen(
  //           screen: takeScreen,
  //         )),
  //   ),
  //   // GoRoute(
  //   //   path: RoutePath.chartCreation,
  //   //   name: RouteName.chartCreation,
  //   //   builder: ((context, state) => ChartCreationScreen(uid: getUid(state))),
  //   // ),
  //   GoRoute(
  //     path: RoutePath.energyMarket,
  //     name: RouteName.energyMarket,
  //     builder: (context, state) => const EnergyMarketScreen(),
  //   ),
  //   GoRoute(
  //     path: RoutePath.storagePlanMarket,
  //     name: RouteName.storagePlanMarket,
  //     builder: (context, state) => const StoragePlanMarketScreen(),
  //   ),
  //   // GoRoute(
  //   //   path: RoutePath.chartView,
  //   //   name: RouteName.chartView,
  //   //   builder: ((context, state) => ChartViewScreen(
  //   //       state.params[RouterParams.chartId]!,
  //   //       uid: getUid(state))),
  //   // ),
  //   // GoRoute(
  //   //   path: RoutePath.allCharts,
  //   //   name: RouteName.allCharts,
  //   //   builder: (context, state) => const AllChartsScreen(
  //   //       // uid: getUid(state),
  //   //       ),
  //   // ),
  //   // GoRoute(
  //   //   path: RoutePath.allChartsWithDrawer,
  //   //   name: RouteName.allChartsWithDrawer,
  //   //   builder: (context, state) => const AllChartsWithDrawerScreen(
  //   //       // uid: getUid(state),
  //   //       ),
  //   // ),
  //   // GoRoute(
  //   //   path: RoutePath.chartSelection,
  //   //   name: RouteName.chartSelection,
  //   //   builder: (context, state) => ChartSelectionScreen(
  //   //     uid: getUid(state),
  //   //   ),
  //   // ),
  //   // GoRoute(
  //   //   path: RoutePath.tagCreation,
  //   //   name: RouteName.tagCreation,
  //   //   builder: ((context, state) => TagCreationScreen(uid: getUid(state))),
  //   // ),
  //   // GoRoute(
  //   //   path: RoutePath.tagView,
  //   //   name: RouteName.tagView,
  //   //   builder: ((context, state) =>
  //   //       TagViewScreen(state.params[RouterParams.tagId]!, uid: getUid(state))),
  //   // ),
  //   // GoRoute(
  //   //   path: RoutePath.allTags,
  //   //   name: RouteName.allTags,
  //   //   builder: (context, state) => const AllTagsScreen(
  //   //       // uid: getUid(state),
  //   //       ),
  //   // ),
  //   // GoRoute(
  //   //   path: RoutePath.checkboxTagList,
  //   //   name: RouteName.checkboxTagList,
  //   //   builder: (context, state) => CheckboxTagListScreen(
  //   //     uid: getUid(state),
  //   //     chartId: state.params[RouterParams.chartId]!,
  //   //   ),
  //   // ),
  //   // GoRoute(
  //   //   path: RoutePath.allNotes,
  //   //   name: RouteName.allNotes,
  //   //   builder: (context, state) => const AllNotesScreen(),
  //   // ),
  //   // GoRoute(
  //   //     path: RoutePath.noteEditor,
  //   //     name: RouteName.noteEditor,
  //   //     builder: (context, state) => NoteEditorScreen(
  //   //           uid: getUid(state),
  //   //           chartId: state.params[RouterParams.chartId]!,
  //   //           noteId: state.params[RouterParams.noteId]!,
  //   //         ))
  // ];

  // static String? getUid(GoRouterState state) {
  //   return state.pathParameters[RouterParams.uid]! == RouterParams.uidNullValue
  //       ? null
  //       : state.pathParameters[RouterParams.uid]!;
  // }
}
