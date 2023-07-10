import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';

import '../features/chart/widget/single_selectable_chart_list_body.dart';
import '../router/route_name.dart';
import '../router/router_params.dart';

class NoteHelper {
  static void openChartSelectionScreen(
    BuildContext context,
    WidgetRef ref,
  ) {
    showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          return SingleSelectableChartListBody(
            onSelect: (_, chart, uid) {
              context.pop();
              openNewNoteEditorScreen(
                context: context,
                chart: chart,
                uid: uid,
                ref: ref,
              );
            },
          );
        });
  }

  static Future<void> openNewNoteEditorScreen(
      {required BuildContext context,
      required Chart chart,
      required String? uid,
      required WidgetRef ref}) async {
    final noteId = await createNewNote(chart: chart, ref: ref);

    SchedulerBinding.instance.addPostFrameCallback((_) {
      // showDialog(
      //     context: context,
      //     builder: (_) => NoteEditorBody(
      //           noteId.toString(),
      //           syncStatus: null,
      //         ));
      //   // context.pop();
      context.pushNamed(RouteName.noteEditor, pathParameters: {
        RouterParams.noteId: noteId.toString(),
        RouterParams.syncStatus: RouterParams.nullValue,
      });
    });
  }

  static void openNoteEditorScreen(
    BuildContext context,
    Note note,
  ) {
    // showDialog(
    //     context: context,
    //     builder: (_) => NoteEditorBody(
    //           note.docId,
    //           syncStatus: note.syncStatus,
    //         ));
    context.pushNamed(RouteName.noteEditor, pathParameters: {
      RouterParams.noteId: note.id.toString(),
      RouterParams.syncStatus: note.syncStatus ?? RouterParams.nullValue,
    });
  }

  static Future<int> createNewNote({
    required Chart chart,
    required WidgetRef ref,
  }) async {
    final now = DateTime.now();
    return await ref.read(insertNoteToLocalProvider)(Note(
        now.millisecondsSinceEpoch,
        title: '...',
        content: '[{"insert":"...\\n"}]',
        created: now,
        edited: now,
        chartId: chart.id));
  }
}
