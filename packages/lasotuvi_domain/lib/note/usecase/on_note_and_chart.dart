part of lasotuvi_domain;

class OnNoteAndChart extends OnSyncablePairData<Note, Chart, NoteAndChart> {
  OnNoteAndChart({required super.repository})
      : super(onCreateItem: (note, chart) => NoteAndChart(note, chart));
}
