import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import '../entity/note.dart';
import '../entity/note_and_chart.dart';

class OnNoteAndChart extends OnSyncablePairData<Note, Chart, NoteAndChart> {
  OnNoteAndChart({required super.repository})
      : super(onCreateItem: (note, chart) => NoteAndChart(note, chart));
}
