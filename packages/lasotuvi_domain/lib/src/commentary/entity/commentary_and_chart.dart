import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import 'commentary.dart';

class CommentaryAndChart extends SyncableEntityPair<Commentary, Chart> {
  CommentaryAndChart(super.entity1, super.entity2);
}
