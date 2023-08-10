import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_presentation/src/features/request/navigation/request_navigation.dart';
import 'package:lasotuvi_tag_shared/lasotuvi_tag_shared.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
// import 'package:lasotuvi_presentation/src/features/commentary/navigation/commentary_navigation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../../helper/pop_to_parrent.dart';
import '../../../router/route_name.dart';
import '../navigation/chart_navigation.dart';
import '../../note/navigation/note_navigation.dart';
import '../../../helper/storage_helper.dart';
import '../../tag/navigation/tag_navigation.dart';
import '../../auth/user_auth_depended_state.dart';

class ChartViewModalScreen extends ConsumerStatefulWidget {
  const ChartViewModalScreen({
    super.key,
    required this.chart,
    required this.saveLastView,
  });
  final Chart chart;
  final bool saveLastView;

  @override
  ConsumerState<ChartViewModalScreen> createState() =>
      _ChartViewModalScreenState();
}

class _ChartViewModalScreenState
    extends UserAuthDependedState<ChartViewModalScreen> {
  final tagListController = WrapTagListControler();
  @override
  void initState() {
    super.initState();
    tagListController.addListener(listenToController);
  }

  void listenToController() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(chartViewControllerProvider);
    return findingUid
        ? const BasicLoadingModal(
            colorScheme: LasotuviAppStyle.colorScheme,
          )
        : BasicStreamBuilder(
            stream: controller.stream(uid, widget.chart),
            child: (data) => data == null
                ? const ErrorTextWidget()
                : WillPopScope(
                    onWillPop: () => onWillPop(
                      uid,
                      data.source,
                      widget.saveLastView,
                    ),
                    child: ChartViewModal(
                      uid: uid,
                      syncStatus: data.source.syncStatus,
                      title: data.source.name,
                      colorScheme: LasotuviAppStyle.colorScheme,
                      onOpenSyncOptions: (context) =>
                          StorageHelper.showOptionsModal(
                        data.source,
                        context: context,
                        uid: uid,
                        ref: ref,
                        doBeforeDeleteForever: () =>
                            popToParrent(context, RouteName.chartView),
                      ),
                      child: ChartViewWidget(
                        data,
                        uid: uid,
                        controller: controller,
                        translate: translate,
                        colorScheme: LasotuviAppStyle.colorScheme,
                        onGoToDetail: (context, chart) {
                          ChartNavigation.openChartDetail(
                              context: context,
                              chartId: chart.docId,
                              syncStatus: chart.syncStatus);
                          // context.pushNamed(RouteName.chartDetail, pathParameters: {
                          //   RouterParams.chartId: chart.docId,
                          //   RouterParams.syncStatus:
                          //       chart.syncStatus ?? RouterParams.nullValue,
                          // });
                        },
                        // onOpenChartSyncOptions: (context, chart) =>
                        //     StorageHelper.showOptionsModal<Chart>(chart,
                        //         context: context,
                        //         uid: uid,
                        //         ref: ref, doBeforeDeleteForever: () {
                        //   popToParrent(context, RouteName.chartView);
                        // }),
                        onOpenTagDetail: (tag) => TagNavigation.openTagDetail(
                          context: context,
                          tag: tag,
                        ),
                        onOpenNoteSyncOptions: (note) =>
                            StorageHelper.showOptionsModal<Note>(note,
                                context: context, uid: uid, ref: ref),
                        openTagSyncOptions: (tag,
                                {required context, required callback}) =>
                            StorageHelper.showOptionsModal(
                          tag,
                          context: context,
                          uid: uid,
                          ref: ref,
                          callback: tagListController.onSyncStatusChange,
                        ),
                        // (item, {required context, required callBack}) =>
                        //     StorageHelper.showOptionsModal(item, context: context, uid: uid, ref: ref),
                        onOpenChartEditOptions: (context, chart) =>
                            ChartNavigation.openChartEditOptions(
                                context, chart),
                        onOpenCheckboxTagList: (context, chart) =>
                            TagNavigation.openCheckboxTagList(context, chart),
                        onOpenNoteCreation: (context, chart) =>
                            NoteNavigation.openNewNoteEditorScreen(
                                context: context,
                                uid: uid,
                                chart: chart,
                                ref: ref),
                        onOpenNoteEditor: (context, note) =>
                            NoteNavigation.openNoteEditorScreen(context, note),
                        onOpenRequestView: (request) =>
                            RequestNavigation.openRequestView(
                          context: context,
                          request: request,
                        ),
                        onSendRequest: (chart) =>
                            ref.read(uploadRequestProvider).call(
                                  uid!,
                                  Request.fromChart(chart),
                                ),
                        // onOpenCommentaryReader:
                        //     (BuildContext context, Commentary commentary) =>
                        //         CommentaryNavigation.openCommentaryReaderScreen(
                        //             context, commentary),
                        // onOpenCommentarySyncOptions: (Commentary item) =>
                        //     StorageHelper.showOptionsModal<Commentary>(item,
                        //         context: context, uid: uid, ref: ref),
                      ),
                    ),
                  ),
          );
  }

  Future<bool> onWillPop(
    String? uid,
    Chart? chart,
    bool saveLastView,
  ) async {
    if (chart == null || !saveLastView) {
      return true;
    }
    await ref.read(updateChartProvider).call(
          uid,
          chart.copyWith(
            lastViewed: DateTime.now(),
          ),
        );
    return true;
  }
}
