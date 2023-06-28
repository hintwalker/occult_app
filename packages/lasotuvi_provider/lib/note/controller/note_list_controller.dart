part of lasotuvi_provider;

final noteListControllerProvider = Provider<NoteListController>(
  (ref) => NoteListController(onSyncableData: ref.read(onNotesProvider)),
);
