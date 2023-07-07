part of lasotuvi_provider;

final noteEditorControllerProvider =
    ChangeNotifierProvider.autoDispose<NoteEditorController>(
  (ref) => NoteEditorController(
    onSyncableData: ref.read(onNoteByIdProvider),
  ),
);
