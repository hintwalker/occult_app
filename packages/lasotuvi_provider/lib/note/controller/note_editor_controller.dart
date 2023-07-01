part of lasotuvi_provider;

final noteEditorControllerProvider = Provider<NoteEditorController>(
  (ref) => NoteEditorController(
    onSyncableData: ref.read(onNoteByIdProvider),
  ),
);
