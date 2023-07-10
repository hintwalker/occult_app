import 'package:tauari_data_core/tauari_data_core.dart';

import '../../../chart/entity/chart.dart';
import '../../entity/note.dart';

abstract class NoteAndChartRepository
    extends SyncableDependentRepository<Note, Chart> {
  NoteAndChartRepository(
      {required super.localRepository, required super.cloudRepository});
}
