import 'package:flutter/material.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show NoteEditorBody;

class NoteEditorScreen extends StatelessWidget {
  const NoteEditorScreen({
    super.key,
    required this.restorationId,
    required this.noteId,
    required this.syncStatus,
  });

  final String? restorationId;
  // final String chartId;
  final String noteId;
  final String syncStatus;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
        restorationId: restorationId,
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: LasotuviAppStyle.colorScheme.background,
          // ),
          body: NoteEditorBody(
            noteId,
            syncStatus: syncStatus,
          ),
        ));
  }
}
