import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import 'note.dart';

class NoteAndChart extends SyncableEntityPair<Note, Chart> {
  NoteAndChart(super.entity1, super.entity2);
}
