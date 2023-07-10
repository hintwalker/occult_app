import 'package:tauari_data_core/tauari_data_core.dart';

import '../../../chart/entity/chart.dart';
import '../../entity/note.dart';

abstract class CloudNoteAndChartRepository
    extends CloudDependentRepository<Note, Chart> {}
