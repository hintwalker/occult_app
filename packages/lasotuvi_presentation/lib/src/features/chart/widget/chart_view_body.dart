import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_chart_tag/lasotuvi_chart_tag.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../../helper/chart_helper.dart';
import '../../../helper/note_helper.dart';
import '../../../helper/storage_helper.dart';
import '../../../helper/tag_helper.dart';
import '../../auth/auth_depended_state.dart';

class ChartViewBody extends ConsumerStatefulWidget {
  const ChartViewBody({
    super.key,
    required this.chart,
  });
  final Chart chart;

  @override
  ConsumerState<ChartViewBody> createState() => _ChartViewBodyState();
}

class _ChartViewBodyState extends AuthDependedState<ChartViewBody> {
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
        ? const Center(child: LoadingWidget())
        : BasicStreamBuilder(
            stream: controller.stream(uid, widget.chart),
            child: (data) => ChartViewModal(
              title: data?.source.name ?? '',
              colorScheme: LasotuviAppStyle.colorScheme,
              child: ChartViewWidget(
                data,
                uid: uid,
                controller: controller,
                translate: translate,
                colorScheme: LasotuviAppStyle.colorScheme,
                onGoToDetail: (context, chart) {
                  ChartHelper.openChartDetail(
                      context: context,
                      chartId: chart.docId,
                      syncStatus: chart.syncStatus);
                  // context.pushNamed(RouteName.chartDetail, pathParameters: {
                  //   RouterParams.chartId: chart.docId,
                  //   RouterParams.syncStatus:
                  //       chart.syncStatus ?? RouterParams.nullValue,
                  // });
                },
                onOpenChartSyncOptions: (chart) =>
                    StorageHelper.showOptionsModal<Chart>(chart,
                        context: context,
                        uid: uid,
                        ref: ref, doBeforeDeleteForever: () {
                  Navigator.popUntil(context, (route) {
                    return !(route.settings.name == null ||
                        route.settings.name == 'chartView');
                  });
                }),
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
                    ChartHelper.openChartEditOptions(context, chart),
                onOpenCheckboxTagList: (context, chart) =>
                    TagHelper.openCheckboxTagList(context, chart),
                onOpenNoteCreation: (context, chart) =>
                    NoteHelper.openNewNoteEditorScreen(
                        context: context, uid: uid, chart: chart, ref: ref),
                onOpenNoteEditor: (context, note) =>
                    NoteHelper.openNoteEditorScreen(context, note),
              ),
            ),
          );
  }
}
