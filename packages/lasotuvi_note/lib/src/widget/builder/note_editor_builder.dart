import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../../controller/note_editor_controller.dart';

class NoteEditorBuilder extends StatelessWidget {
  const NoteEditorBuilder({
    super.key,
    required this.uid,
    required this.noteId,
    required this.syncStatus,
    required this.controller,
    // required this.onWillPop,
    required this.child,
  });
  final String? uid;
  final String noteId;
  final String? syncStatus;
  final NoteEditorController controller;
  // final Future<bool> Function(Note note) onWillPop;
  final Widget Function(Note note) child;

  @override
  Widget build(BuildContext context) {
    final docId = int.tryParse(noteId);

    return docId == null
        ? const ErrorTextWidget()
        : BasicStreamBuilder(
            stream: controller.stream(
              uid: uid,
              docId: docId,
              syncStatus: syncStatus,
            ),
            child: (note) =>
                note == null ? const ErrorTextWidget() : child(note),
            // builder: (context, snapshot) {
            //   if (snapshot.connectionState == ConnectionState.waiting) {
            //     return const LoadingWidget();
            //   } else if (snapshot.hasData) {
            //     final note = snapshot.requireData;
            //     if (note == null) {
            //       return const ErrorTextWidget();
            //     } else {
            //       return child(note);
            //       // WillPopScope(
            //       //   onWillPop: () => onWillPop(note),
            //       //   child: child(note),
            //       // );
            //     }
            //   } else {
            //     return const ErrorTextWidget();
            //   }
            // }
          );
  }
}
