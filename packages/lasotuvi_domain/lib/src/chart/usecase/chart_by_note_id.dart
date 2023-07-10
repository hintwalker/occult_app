import 'package:tauari_data_core/tauari_data_core.dart';

import '../../note/entity/note.dart';
import '../entity/chart.dart';

class ChartByNoteId extends OwnerByDependentId<Note, Chart> {
  ChartByNoteId(super.repository);
}
