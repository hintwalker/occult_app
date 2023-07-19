import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import '../entity/commentary.dart';

class OnCommentaryByChartId extends OnDependedByOwnerId<Commentary, Chart> {
  OnCommentaryByChartId(super.repository);
}
