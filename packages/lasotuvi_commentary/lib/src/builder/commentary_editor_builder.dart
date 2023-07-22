import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../controller/commentary_editor_controller.dart';

class CommentaryEditorBuilder extends StatelessWidget {
  const CommentaryEditorBuilder({
    super.key,
    required this.uid,
    required this.commentaryId,
    required this.syncStatus,
    required this.controller,
    // required this.onWillPop,
    required this.child,
  });
  final String? uid;
  final String commentaryId;
  final String? syncStatus;
  final CommentaryEditorController controller;
  // final Future<bool> Function(Commentary commentary) onWillPop;
  final Widget Function(Commentary commentary) child;

  @override
  Widget build(BuildContext context) {
    final docId = int.tryParse(commentaryId);

    return docId == null
        ? const ErrorTextWidget()
        : BasicStreamBuilder(
            stream: controller.stream(
              uid: uid,
              docId: docId,
              syncStatus: syncStatus,
            ),
            child: (commentary) => commentary == null
                ? const ErrorTextWidget()
                : child(commentary),
          );
  }
}
