import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
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
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(chartViewControllerProvider);
    return findingUid
        ? const LoadingWidget()
        : ChartViewModal(
            uid: uid,
            chart: widget.chart,
            colorScheme: LasotuviAppStyle.colorScheme,
            controller: controller,
            child: (chartHasTags) => ChartViewWidget(
                  chartHasTags,
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
                  chartSyncOptions: (item, {syncStatus, uid}) =>
                      StorageHelper.storageOptionsModalBuilder<Chart>(item,
                          uid: uid,
                          syncStatus: syncStatus,
                          ref: ref, doBeforeDeleteForever: () {
                    Navigator.popUntil(context, (route) {
                      return route.settings.name != 'chartView';
                    });
                  }),
                  noteSyncOptions: (item, {syncStatus, uid}) =>
                      StorageHelper.storageOptionsModalBuilder<Note>(item,
                          uid: uid, syncStatus: syncStatus, ref: ref),
                  openTagSyncOptions: (tag,
                          {required context, required callback}) =>
                      StorageHelper.showOptionsModal(tag,
                          context: context, uid: uid, ref: ref),
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
                ));
  }

  @override
  void dispose() {
    // ref.read(chartViewControllerProvider).dispose();
    super.dispose();
  }
}
