part of lasotuvi_provider;

final noteListControllerProvider =
    ChangeNotifierProvider.autoDispose<NoteListController>(
  (ref) => NoteListController(onSyncableData: ref.read(onNotesProvider)),
);
