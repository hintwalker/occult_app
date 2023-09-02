import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
// import 'package:lasotuvi_commentary/lasotuvi_commentary.dart';
import 'package:lasotuvi_note/lasotuvi_note.dart';
import '../../../config/app_config.dart';
import '../../../shared/widget/new_data_option_button.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
// import 'package:lasotuvi_request/lasotuvi_request.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../chart/navigation/chart_navigation.dart';
// import '../../commentary/navigation/commentary_navigation.dart';
import '../../note/navigation/note_navigation.dart';
import '../../../helper/storage_helper.dart';
// import '../../request/navigation/request_navigation.dart';
import '../../tag/navigation/tag_navigation.dart';
import '../../../styles/general_style.dart';
import '../../auth/user_auth_depended_state.dart';
import '../../navigation/drawer_ids.dart';
import '../../statistics/widget/current_sub_widget_container.dart';

class HomeBody extends ConsumerStatefulWidget {
  const HomeBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeBodyState();
}

class _HomeBodyState extends UserAuthDependedState<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (AppConfig.showCurrentPlan)
                  CurrentSubWidgetContainer(
                    uid: uid,
                    translate: translate,
                  ),
                SizedBox(
                  height: GeneralStyle.topTenBannerHeight,
                  child: TopTenChartsBanner(
                    controller: ref.watch(chartListControllerProvider),
                    uid: uid,
                    translate: translate,
                    colorScheme: LasotuviAppStyle.colorScheme,
                    onAddData: () =>
                        ChartNavigation.openChartCreationScreen(context),
                    onShowAll: openAllChartsScreen,
                    onItemTap: (context, chart) =>
                        ChartNavigation.openChartView(
                      context: context,
                      chart: chart,
                      saveLastView: true,
                    ),
                    // chartView: (chartId) => ChartViewBody(chartId: chartId),
                    onOpenSyncOptions: (chart) =>
                        StorageHelper.showOptionsModal(
                      chart,
                      context: context,
                      uid: uid,
                      ref: ref,
                    ),
                    countController:
                        ref.watch(countChartEveryWhereControllerProvider),
                    countOnCloudController:
                        ref.watch(countChartOnCloudControllerProvider),
                  ),
                ),
                // SizedBox(
                //   height: 264.0,
                //   child: TopTenRequestBanner(
                //     uid: uid,
                //     controller: ref.watch(requestListControllerProvider),
                //     translate: translate,
                //     colorScheme: LasotuviAppStyle.colorScheme,
                //     // onAddData: () =>
                //     //     CommentaryNavigation.openChartSelectionScreen(context, ref),
                //     onShowAll: openAllCommentaryScreen,
                //     onItemTap: (context, item) =>
                //         RequestNavigation.openRequestView(
                //             context: context, request: item),
                //     onOpenSyncOptions: (item) => StorageHelper.showOptionsModal(
                //       item,
                //       context: context,
                //       uid: uid,
                //       ref: ref,
                //     ),
                //     countController:
                //         ref.watch(countRequestEveryWhereControllerProvider),
                //   ),
                // ),
                SizedBox(
                  height: 184.0,
                  child: TopTenTagsBanner(
                    controller: ref.watch(tagListControllerProvider),
                    uid: uid,
                    translate: translate,
                    colorScheme: LasotuviAppStyle.colorScheme,
                    onAddData: () => TagNavigation.openTagCreationScreen(
                      context,
                      (tag) => TagNavigation.openTagDetail(
                          context: context, tag: tag),
                    ),
                    onShowAll: openAllTagsScreen,
                    onItemTap: (context, tag) =>
                        TagNavigation.openTagDetail(context: context, tag: tag),
                    onOpenSyncOptions: (tag) => StorageHelper.showOptionsModal(
                      tag,
                      context: context,
                      uid: uid,
                      ref: ref,
                    ),
                    countController:
                        ref.watch(countTagEveryWhereControllerProvider),
                    countOnCloudController:
                        ref.watch(countTagOnCloudControllerProvider),
                  ),
                ),

                // Expanded(
                // child:
                TopTenNotesBanner(
                  uid: uid,
                  controller: ref.watch(noteAndChartListControllerProvider),
                  translate: translate,
                  colorScheme: LasotuviAppStyle.colorScheme,
                  onAddData: () =>
                      NoteNavigation.openChartSelectionScreen(context, ref),
                  onShowAll: openAllNotesScreen,
                  onItemTap: (note) =>
                      NoteNavigation.openNoteEditorScreen(context, note),
                  onOpenSyncOptions: (item) => StorageHelper.showOptionsModal(
                    item,
                    context: context,
                    uid: uid,
                    ref: ref,
                  ),
                  countController:
                      ref.watch(countNoteEveryWhereControllerProvider),
                  countOnCloudController:
                      ref.watch(countNoteOnCloudControllerProvider),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                // ElevatedButton(
                //     onPressed: openAllNotesScreen,
                //     child: Text(translate('showAllNotes'))),
                const SizedBox(
                  height: 192.0,
                ),
                const Divider(
                  height: 1.0,
                  thickness: 1.0,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                const Divider(
                  height: 1.0,
                  thickness: 1.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppConfig.version,
                      style: TextStyle(
                        color: LasotuviAppStyle.colorScheme.primary,
                      ),
                    )
                  ],
                )
                // )
              ],
            ),
          ),
          const NewDataOptionButton(),
        ],
      ),
    );
  }

  // void openChartView({required BuildContext context, required String chartId}) {
  //   Scaffold.of(context).showBottomSheet(
  //       // context: context,
  //       (_) {
  //     return SingleChildScrollView(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         mainAxisSize: MainAxisSize.min,
  //         children: [ChartViewBody(chartId: chartId)],
  //       ),
  //     );
  //   });
  // }

  // void openChartCreationScreen() {
  //   context.pushNamed(RouteName.chartCreation);
  //   // showGeneralDialog(
  //   //   context: context,
  //   //   barrierDismissible: false,
  //   //   transitionDuration: const Duration(seconds: 1),
  //   //   transitionBuilder: (context, animation, secondaryAnimation, child) =>
  //   //       FadeTransition(
  //   //           opacity: animation,
  //   //           child: ScaleTransition(scale: animation, child: child)),
  //   //   pageBuilder: (context, animation, secondaryAnimation) => SafeArea(
  //   //       child: Container(
  //   //     width: MediaQuery.of(context).size.width,
  //   //     height: MediaQuery.of(context).size.height,
  //   //     padding: const EdgeInsets.all(16.0),
  //   //     child: ChartCreationForm(
  //   //         colorScheme: lightColorScheme,
  //   //         translate: translate,
  //   //         onCreateChart: onCreateChart),
  //   //   )),
  //   // );
  // }

  void openAllChartsScreen() {
    // context.goNamed(RouteName.charts);
    ref.read(mainDrawerControllerProvider).setScreenId(DrawerIds.charts);
  }

  void openAllTagsScreen() {
    ref.read(mainDrawerControllerProvider).setScreenId(DrawerIds.tags);
  }

  // void openChartSelectionScreen() {
  //   showBottomSheet(
  //       context: context,
  //       builder: (ctx) {
  //         return SingleChildScrollView(
  //             child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //               SizedBox(
  //                 height: MediaQuery.sizeOf(context).height * 4 / 5,
  //                 child: SingleSelectableChartListBody(
  //                   onSelect: (_, chart, uid) {
  //                     openNoteEditorScreen(chart, uid);
  //                   },
  //                 ),
  //               ),
  //             ]));
  //       });
  // }

  // Future<void> openNoteEditorScreen(Chart chart, String? uid) async {
  //   final now = DateTime.now();
  //   final noteId = await ref.read(insertNoteToLocalProvider)(Note(
  //       now.millisecondsSinceEpoch,
  //       title: 'No title',
  //       content: '',
  //       created: now,
  //       edited: now,
  //       chartId: chart.id));
  //   if (context.mounted) {
  //     context.pop();
  //     context.pushNamed(RouteName.noteEditor, pathParameters: {
  //       RouterParams.noteId: noteId.toString(),
  //     });
  //   }
  // }

  void openAllNotesScreen() {
    ref.read(mainDrawerControllerProvider).setScreenId(DrawerIds.notes);
  }

  void openAllCommentaryScreen() {
    ref.read(mainDrawerControllerProvider).setScreenId(DrawerIds.commentaries);
  }

  Future<bool> onWillPop(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (_) => const ShutdownConfirmDialog(
          colorScheme: LasotuviAppStyle.colorScheme, translate: translate),
    );
    if (result == null || !result) {
      return false;
    } else {
      await ref.read(firestoreCacheHelperProvider).close(
            clearAllData: false,
          );
      SystemNavigator.pop();
      return true;
    }
  }
}
