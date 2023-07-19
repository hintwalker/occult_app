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
    show
        Dashboard,
        RouteName,
        RoutePath,
        RouterParams,
        rootNavigatorKey,
        shellNavigatorKey;
import 'package:tauari_ui/tauari_ui.dart';

import '../screen/chart/all_charts.dart';
import '../screen/chart/chart.dart';
import '../screen/chart/chart_creation.dart';
import '../screen/chart/chart_detail.dart';
import '../screen/commentary/all_commentaries.dart';
import '../screen/home.dart';
import '../screen/library/library.dart';
import '../screen/market/market.dart';
import '../screen/note/all_notes.dart';
import '../screen/note/note_editor.dart';
import '../screen/storage_plan/all_storage_plans.dart';
import '../screen/tag/all_tags.dart';

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
            name: 'dashboard',
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
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const FadeTransitionPage(
                child: HomeScreen(
              restorationId: 'home',
              // drawerController: mainDrawerController,
            )),
          ),
          GoRoute(
            name: RouteName.energyMarket,
            path: RoutePath.energyMarket,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const FadeTransitionPage(
              child: MarketScreen(
                restorationId: 'energyMarket',
                // drawerController: mainDrawerController,
              ),
            ),
          ),
          GoRoute(
            name: RouteName.storagePlanMarket,
            path: RoutePath.storagePlanMarket,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const FadeTransitionPage(
              child: AllStoragePlansScreen(
                restorationId: RouteName.storagePlanMarket,
                // drawerController: mainDrawerController,
              ),
            ),
          ),
          GoRoute(
            name: RouteName.charts,
            path: RoutePath.charts,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const FadeTransitionPage(
              child: ChartsScreen(
                restorationId: RouteName.charts,
                // drawerController: mainDrawerController,
              ),
            ),
          ),
          GoRoute(
            name: RouteName.commentaries,
            path: RoutePath.commentaries,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const FadeTransitionPage(
              child: AllCommentariesScreen(
                restorationId: RouteName.commentaries,
                // drawerController: mainDrawerController,
              ),
            ),
          ),
          GoRoute(
            name: RouteName.notes,
            path: RoutePath.notes,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const FadeTransitionPage(
              child: AllNotesScreen(
                restorationId: RouteName.notes,
                // drawerController: mainDrawerController,
              ),
            ),
          ),
          GoRoute(
            name: RouteName.tags,
            path: RoutePath.tags,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const FadeTransitionPage(
              child: AllTagsScreen(
                restorationId: RouteName.tags,
                // drawerController: mainDrawerController,
              ),
            ),
          ),
          GoRoute(
            name: RouteName.library,
            path: RoutePath.library,
            parentNavigatorKey: shellNavigatorKey,
            pageBuilder: (context, state) => const FadeTransitionPage(
              child: LibraryScreen(
                restorationId: RouteName.library,
                // drawerController: mainDrawerController,
              ),
            ),
          ),
        ]),
    GoRoute(
      path: RoutePath.chartCreation,
      name: RouteName.chartCreation,
      parentNavigatorKey: rootNavigatorKey,
      // builder: (context, state) => const ChartCreationScreen(
      //   restorationId: RouteName.chartCreation,
      // ),
      pageBuilder: (context, state) => const FadeTransitionPage(
          child: ChartCreationScreen(
        restorationId: RouteName.chartCreation,
      )),
    ),
    GoRoute(
      path: RoutePath.chartView,
      name: RouteName.chartView,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => ChartScreen(
        restorationId: RouteName.chartView,
        // uid: state.pathParameters[RouterParams.uid]!,
        chartId: state.pathParameters[RouterParams.chartId]!,
      ),
    ),
    GoRoute(
      path: RoutePath.chartDetail,
      name: RouteName.chartDetail,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => ChartDetailScreen(
        restorationId: RouteName.chartView,
        chartId: state.pathParameters[RouterParams.chartId]!,
        syncStatus: state.pathParameters[RouterParams.syncStatus]!,
      ),
    ),
    GoRoute(
      path: RoutePath.noteEditor,
      name: RouteName.noteEditor,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => NoteEditorScreen(
        restorationId: RouteName.noteEditor,
        noteId: state.pathParameters[RouterParams.noteId]!,
        syncStatus: state.pathParameters[RouterParams.syncStatus]!,
      ),
    ),
    // GoRoute(
    //   path: RoutePath.tagDetail,
    //   name: RouteName.tagDetail,
    //   parentNavigatorKey: rootNavigatorKey,
    //   builder: (context, state) => TagDetailScreen(
    //     restorationId: RouteName.tagDetail,
    //     tagId: state.pathParameters[RouterParams.tagId]!,
    //   ),
    // ),
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
