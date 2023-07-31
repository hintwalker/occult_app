import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
// import 'package:lasotuvi_commentary/lasotuvi_commentary.dart';
import 'package:lasotuvi_note/lasotuvi_note.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
// import 'package:lasotuvi_request/lasotuvi_request.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';
import 'package:tauari_translate/tauari_translate.dart';

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
import '../controller/home_controller.dart';
import 'data_creation_options_modal.dart';

class HomeBody extends ConsumerStatefulWidget {
  const HomeBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeBodyState();
}

class _HomeBodyState extends UserAuthDependedState<HomeBody> {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                  onItemTap: (context, chart) => ChartNavigation.openChartView(
                    context: context,
                    chart: chart,
                  ),
                  // chartView: (chartId) => ChartViewBody(chartId: chartId),
                  onOpenSyncOptions: (chart) => StorageHelper.showOptionsModal(
                    chart,
                    context: context,
                    uid: uid,
                    ref: ref,
                  ),
                  countController:
                      ref.watch(countChartEveryWhereControllerProvider),
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
                height: 168.0,
                child: TopTenTagsBanner(
                  controller: ref.watch(tagListControllerProvider),
                  uid: uid,
                  translate: translate,
                  colorScheme: LasotuviAppStyle.colorScheme,
                  onAddData: () => TagNavigation.openTagCreationScreen(
                    context,
                    (tag) =>
                        TagNavigation.openTagDetail(context: context, tag: tag),
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
              ),
              const SizedBox(
                height: 48.0,
              ),
              ElevatedButton(
                  onPressed: openAllNotesScreen,
                  child: Text(translate('showAllNotes'))),
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
                  Text('---',
                      style: TextStyle(
                          color: LasotuviAppStyle.colorScheme.primary))
                ],
              )
              // )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                color: LasotuviAppStyle.colorScheme.primaryContainer,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(44.0),
                  bottomRight: Radius.circular(44.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: LasotuviAppStyle.colorScheme.outline,
                    offset: const Offset(2.0, 2.0),
                    spreadRadius: 1.0,
                    blurRadius: 2.0,
                  ),
                  BoxShadow(
                    color: LasotuviAppStyle.colorScheme.primaryContainer,
                    // offset: const Offset(2.0, 2.0),
                    // spreadRadius: 2.0,
                    // blurRadius: 2.0,
                  )
                ]),
            child: InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => const DataCreationOptionsModal()),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(44.0),
                bottomRight: Radius.circular(44.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  onPressed: null,
                  disabledColor: LasotuviAppStyle.colorScheme.primary,
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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
}
