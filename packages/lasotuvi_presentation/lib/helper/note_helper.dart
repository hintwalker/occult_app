part of lasotuvi_presentation;

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
      // context.pop();
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
        title: 'No title',
        content: '[{"insert":"...\\n"}]',
        created: now,
        edited: now,
        chartId: chart.id));
  }
}
