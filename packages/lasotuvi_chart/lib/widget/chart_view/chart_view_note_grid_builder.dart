part of lasotuvi_chart;

class ChartViewNoteGridBuilder extends StatelessWidget {
  const ChartViewNoteGridBuilder({
    super.key,
    this.uid,
    required this.translate,
    required this.colorScheme,
    required this.notes,
    required this.openSyncOptions,
  });
  final String? uid;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final Stream<Iterable<Note>> Function() notes;
  final void Function(BuildContext context, Note note) openSyncOptions;

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
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline),
                    label: Text(
                      translate('addNote'),
                    ),
                  ),
                ]),
                DataGridWidget<Note>(
                  snapshot.requireData,
                  itemWidget: (note) => NoteItemWidget(
                    note,
                    uid: uid,
                    colorScheme: colorScheme,
                    onSyncStatusTap: () => openSyncOptions(context, note),
                  ),
                ),
              ],
            );
          } else {
            return const ErrorTextWidget();
          }
        });
  }
}
