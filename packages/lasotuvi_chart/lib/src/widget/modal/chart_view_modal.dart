import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ChartViewModal extends StatelessWidget {
  const ChartViewModal({
    super.key,
    required this.title,
    required this.uid,
    // required this.chart,
    required this.colorScheme,
    required this.syncStatus,
    required this.onOpenSyncOptions,
    // required this.controller,
    required this.child,
    // required this.translate,
    // required this.onGoToDetail,
    // required this.chartSyncOptions,
    // required this.noteSyncOptions,
    // required this.tagSyncOptions,
    // required this.onOpenCheckboxTagList,
    // required this.onOpenChartEditOptions,
    // required this.onOpenNoteCreation,
    // required this.onOpenNoteEditor,
  });
  final String? uid;
  final ColorScheme colorScheme;
  final String title;
  final Widget child;
  final String? syncStatus;
  final void Function(BuildContext context) onOpenSyncOptions;
  // final ChartViewController controller;
  // final Widget Function(ChartHasTags chartHasTags) child;
  // final String Function(String) translate;
  // final void Function(BuildContext context, Chart chart) onGoToDetail;
  // final Widget Function(Chart, {String? uid, String? syncStatus})
  //     chartSyncOptions;
  // final Widget Function(Note, {String? uid, String? syncStatus})
  //     noteSyncOptions;
  // final Widget Function(Tag, {String? uid, String? syncStatus}) tagSyncOptions;
  // final void Function(BuildContext context, Chart chart) onOpenCheckboxTagList;
  // final void Function(BuildContext context, Chart chart) onOpenChartEditOptions;
  // final void Function(BuildContext context, Chart chart) onOpenNoteCreation;
  // final void Function(BuildContext context, Note note) onOpenNoteEditor;

  @override
  Widget build(BuildContext context) {
    return
        // ChartViewBuilder(
        //   uid: uid,
        //   controller: controller,
        //   chart: chart,
        //   colorScheme: colorScheme,
        //   child: (chartHasTags) =>
        BasicModal(
      title: title,
      colorScheme: colorScheme,
      actions: [
        SyncStatusRibbonWidget(
          uid: uid,
          syncStatus: syncStatus,
          onlyCloudColor: colorScheme.outlineVariant,
          onlyLocalColor: colorScheme.outline,
          syncedColor: colorScheme.tertiary,
          // colorScheme: colorScheme,
          onTap: () => onOpenSyncOptions(context),
        )
      ],
      child: child,
      // colorScheme: colorScheme,
      // translate: translate,
      // onGoToDetail: onGoToDetail,
      // chartSyncOptions: chartSyncOptions,
      // noteSyncOptions: noteSyncOptions,
      // tagSyncOptions: tagSyncOptions,
      // onOpenChartEditOptions: onOpenChartEditOptions,
      // onOpenCheckboxTagList: onOpenCheckboxTagList,
      // onOpenNoteCreation: onOpenNoteCreation,
      // onOpenNoteEditor: onOpenNoteEditor,
      // ),
    );
  }
}
