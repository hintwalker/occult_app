part of lasotuvi_note;

class NoteAndChartListController
    extends SyncablePairDataListStreamController<Note, Chart, NoteAndChart> {
  NoteAndChartListController({required OnNoteAndChart onData})
      : super(onSyncableData: onData);
}
