import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import '../widget/commentary_reader_body.dart';

class CommentaryNavigation {
  // static void openChartSelectionScreen(
  //   BuildContext context,
  //   WidgetRef ref,
  // ) {
  //   showGeneralDialog(
  //       context: context,
  //       pageBuilder: (context, animation, secondaryAnimation) {
  //         return SingleSelectableChartListBody(
  //           onSelect: (_, chart, uid) {
  //             context.pop();
  //             openNewCommentaryReaderScreen(
  //               context: context,
  //               chart: chart,
  //               uid: uid,
  //               ref: ref,
  //             );
  //           },
  //         );
  //       });
  // }

  // static Future<void> openNewCommentaryReaderScreen(
  //     {required BuildContext context,
  //     required Chart chart,
  //     required String? uid,
  //     required WidgetRef ref}) async {
  //   final commentaryId = await createNewCommentary(chart: chart, ref: ref);

  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     // showDialog(
  //     //     context: context,
  //     //     builder: (_) => CommentaryEditorBody(
  //     //           commentaryId.toString(),
  //     //           syncStatus: null,
  //     //         ));
  //     //   // context.pop();
  //     context.pushNamed(RouteName.commentaryReader, pathParameters: {
  //       RouterParams.commentaryId: commentaryId.toString(),
  //       RouterParams.syncStatus: RouterParams.nullValue,
  //     });
  //   });
  // }

  static void openCommentaryReaderScreen(
    BuildContext context,
    Commentary commentary,
  ) {
    showDialog(
        context: context,
        builder: (_) => CommentaryReaderBody(
              commentary.id,
              syncStatus: commentary.syncStatus,
            ));
    // context.pushNamed(RouteName.commentaryReader, pathParameters: {
    //   RouterParams.commentaryId: commentary.id.toString(),
    //   RouterParams.syncStatus: commentary.syncStatus ?? RouterParams.nullValue,
    // });
  }

  // static Future<int> createNewCommentary({
  //   required Chart chart,
  //   required WidgetRef ref,
  // }) async {
  //   final now = DateTime.now();
  //   return await ref.read(insertCommentaryToLocalProvider)(Commentary(
  //       now.millisecondsSinceEpoch,
  //       title: '...',
  //       content: '[{"insert":"...\\n"}]',
  //       created: now,
  //       lastViewed: now,
  //       chartId: chart.id));
  // }
}
