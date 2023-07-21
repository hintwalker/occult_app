import 'package:flutter/material.dart';
import 'package:lasotuvi_note_shared/lasotuvi_note_shared.dart';
import 'package:lasotuvi_tag_shared/lasotuvi_tag_shared.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../../controller/chart_view_controller.dart';
import 'chart_view_avatar_widget.dart';
import 'chart_view_bio_widget.dart';

class ChartViewWidget extends StatelessWidget {
  const ChartViewWidget(
    this.chartHasTags, {
    super.key,
    this.uid,
    required this.controller,
    required this.translate,
    required this.onGoToDetail,
    required this.colorScheme,
    required this.onOpenChartSyncOptions,
    required this.onOpenNoteSyncOptions,
    required this.openTagSyncOptions,
    // required this.onOpenCommentarySyncOptions,
    required this.onOpenCheckboxTagList,
    required this.onOpenChartEditOptions,
    required this.onOpenNoteCreation,
    required this.onOpenNoteEditor,
    required this.onOpenRequestView,
    required this.onSendRequest,
    // required this.onOpenCommentaryReader,
  });
  final String? uid;
  final ChartHasTags? chartHasTags;
  final ChartViewController controller;
  final ColorScheme colorScheme;
  final void Function(Chart chart) onOpenChartSyncOptions;
  final void Function(Note note) onOpenNoteSyncOptions;
  final void Function(Request request) onOpenRequestView;
  // final void Function(Commentary commentary) onOpenCommentarySyncOptions;
  // final Widget Function(Chart, {String? uid, String? syncStatus})
  //     chartSyncOptions;
  // final Widget Function(Note, {String? uid, String? syncStatus})
  //     noteSyncOptions;
  final Function(Tag,
      {required BuildContext context,
      required void Function() callback}) openTagSyncOptions;

  final String Function(String) translate;
  final void Function(BuildContext context, Chart chart) onGoToDetail;
  final void Function(BuildContext context, Chart chart) onOpenCheckboxTagList;
  final void Function(BuildContext context, Chart chart) onOpenChartEditOptions;
  final void Function(BuildContext context, Chart chart) onOpenNoteCreation;
  final void Function(BuildContext context, Note note) onOpenNoteEditor;
  final void Function(Chart chart) onSendRequest;
  // final void Function(BuildContext context, Commentary commentary)
  //     onOpenCommentaryReader;

  @override
  Widget build(BuildContext context) {
    final wrapTagListController = WrapTagListControler();
    return chartHasTags == null
        ? const Center(child: ErrorTextWidget())
        : Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ChartViewBioWidget(
                              chartHasTags!.source,
                              translate: translate,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          // const Spacer(),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ChartViewAvatarWidget(
                                    chartHasTags!.source,
                                    uid: uid,
                                    colorScheme: colorScheme,
                                    openSyncOptions: (_, chart) =>
                                        onOpenChartSyncOptions(chart),
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () => onOpenChartEditOptions(
                                        context, chartHasTags!.source),
                                    icon: const Icon(Icons.edit),
                                    label: Text(
                                      translate('changeInfo'),
                                    ),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Row(children: [
                        Text(
                          '${translate('tag')} (${chartHasTags!.carry.length})',
                          style: TextStyle(
                              fontSize: 22.0, color: colorScheme.primary),
                        ),
                        const SizedBox(width: 12.0),
                        ElevatedButton.icon(
                          onPressed: () => onOpenCheckboxTagList(
                              context, chartHasTags!.source),
                          icon: const Icon(Icons.add_circle_outline),
                          label: Text(
                            translate('addTag'),
                          ),
                        ),
                      ]),

                      WrapTagListWidget(
                          tags: chartHasTags!.carry,
                          itemBuilder: (e) => HoriTagItemWidget(e,
                              uid: uid,
                              colorScheme: colorScheme,
                              onSyncStatusTap: () => openTagSyncOptions(e,
                                  context: context,
                                  callback:
                                      wrapTagListController.onSyncStatusChange),
                              onTap: (context, tag) {}),
                          controller: wrapTagListController),
                      const SizedBox(
                        height: 24.0,
                      ),

                      // const SizedBox(
                      //   height: 24.0,
                      // ),
                      // BasicStreamBuilder(
                      //   stream: controller.commentaryStream(
                      //       uid, chartHasTags!.source),
                      //   child: (data) => CommentaryGridWidget(
                      //     uid: uid,
                      //     colorScheme: colorScheme,
                      //     translate: translate,
                      //     data: data,
                      //     onOpenSyncOptions: (_, commentary) =>
                      //         onOpenCommentarySyncOptions(commentary),
                      //     // onOpenCommentaryCreation: (context) =>
                      //     //     onOpenNoteCreation(context, chartHasTags!.source),
                      //     onOpenCommentaryReader: onOpenCommentaryReader,
                      //   ),
                      // ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      BasicStreamBuilder(
                        stream:
                            controller.noteStream(uid, chartHasTags!.source),
                        child: (data) => NoteGridWidget(
                          uid: uid,
                          colorScheme: colorScheme,
                          translate: translate,
                          data: data,
                          onOpenSyncOptions: (_, note) =>
                              onOpenNoteSyncOptions(note),
                          onOpenNoteCreation: (context) =>
                              onOpenNoteCreation(context, chartHasTags!.source),
                          onOpenNoteEditor: onOpenNoteEditor,
                        ),
                      ),
                      const SizedBox(
                        height: 192.0,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                left: 0.0,
                child: Container(
                  // padding: const EdgeInsets.all(0.0),
                  decoration: BoxDecoration(
                      color: colorScheme.background,
                      // border: Border(
                      //   top: BorderSide(color: colorScheme.outline),
                      // ),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.outline,
                          offset: const Offset(0, 0),
                          spreadRadius: 12.0,
                          blurRadius: 5.0,
                        ),
                        BoxShadow(
                          color: colorScheme.background,
                          offset: const Offset(0, 0),
                          spreadRadius: 10.0,
                          blurRadius: 0.0,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0.0, right: 12.0, left: 12.0, bottom: 12.0),
                    child: Row(
                      children: [
                        FilledButton(
                            style: FilledButton.styleFrom(
                                backgroundColor: colorScheme.tertiary),
                            onPressed: () =>
                                onSendRequest(chartHasTags!.source),
                            child: Text(translate('sendCommentaryRequest'),
                                style: TextStyle(
                                  color: colorScheme.onTertiary,
                                ))),
                        const Spacer(),
                        FilledButton(
                          onPressed: () =>
                              onGoToDetail(context, chartHasTags!.source),
                          child: Text(
                            translate('watchChartDetail'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }

  // void openChartSyncOptions(BuildContext context, Chart item) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) =>
  //           chartSyncOptions(item, syncStatus: item.syncStatus, uid: uid));
  // }

  // void openNoteSyncOptions(BuildContext context, Note item) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) =>
  //           noteSyncOptions(item, syncStatus: item.syncStatus, uid: uid));
  // }

  // void openTagSyncOptions(BuildContext context, Tag item) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) =>
  //           tagSyncOptions(item, syncStatus: item.syncStatus, uid: uid));
  // }
}
