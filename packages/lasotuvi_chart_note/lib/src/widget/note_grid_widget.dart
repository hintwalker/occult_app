import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart' show Note;
import 'package:tauari_ui/tauari_ui.dart';

import '../../lasotuvi_chart_note.dart';

class NoteGridWidget extends StatelessWidget {
  const NoteGridWidget({
    super.key,
    required this.uid,
    required this.data,
    required this.colorScheme,
    required this.translate,
    required this.onOpenNoteCreation,
    required this.onOpenNoteEditor,
    required this.onOpenSyncOptions,
  });
  final String? uid;
  final Iterable<Note> data;
  final ColorScheme colorScheme;
  final String Function(String) translate;

  final void Function(BuildContext context, Note note) onOpenSyncOptions;
  final void Function(BuildContext context) onOpenNoteCreation;
  final void Function(BuildContext context, Note note) onOpenNoteEditor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Text(
            '${translate('note')} (${data.length})',
            style: TextStyle(fontSize: 22.0, color: colorScheme.primary),
          ),
          const SizedBox(width: 12.0),
          ElevatedButton.icon(
            onPressed: () => onOpenNoteCreation(context),
            icon: const Icon(Icons.add_circle_outline),
            label: Text(
              translate('addNote'),
            ),
          ),
        ]),
        DataGridWidget<Note>(
          data,
          itemWidget: (note) => NoteItemWidget(note,
              uid: uid,
              colorScheme: colorScheme,
              onSyncStatusTap: () => onOpenSyncOptions(context, note),
              onTap: onOpenNoteEditor),
        ),
      ],
    );
  }
}
