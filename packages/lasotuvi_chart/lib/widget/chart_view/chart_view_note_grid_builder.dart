part of lasotuvi_chart;

class ChartViewNoteGridBuilder extends StatelessWidget {
  const ChartViewNoteGridBuilder({
    super.key,
    this.uid,
    required this.translate,
    required this.colorScheme,
    required this.notes,
    required this.onOpenSyncOptions,
    required this.onOpenNoteCreation,
    required this.onOpenNoteEditor,
  });
  final String? uid;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final Stream<Iterable<Note>> Function() notes;
  final void Function(BuildContext context, Note note) onOpenSyncOptions;
  final void Function(BuildContext context) onOpenNoteCreation;
  final void Function(BuildContext context, Note note) onOpenNoteEditor;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: notes(), // controller.noteStream(uid, chartHasTags.source.id),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Row(children: [
                  Text(
                    '${translate('note')} (${snapshot.requireData.length})',
                    style:
                        TextStyle(fontSize: 22.0, color: colorScheme.primary),
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
                  snapshot.requireData,
                  itemWidget: (note) => NoteItemWidget(note,
                      uid: uid,
                      colorScheme: colorScheme,
                      onSyncStatusTap: () => onOpenSyncOptions(context, note),
                      onTap: onOpenNoteEditor),
                ),
              ],
            );
          } else {
            return const ErrorTextWidget();
          }
        });
  }
}
