import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import '../entity/note.dart';

class OnNoteByChartId extends OnDependedByOwnerId<Note, Chart> {
  OnNoteByChartId(super.repository);
}
