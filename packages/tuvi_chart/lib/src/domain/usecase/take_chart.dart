import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/chart_repository.dart';

class TakeChart extends TakeById<Chart, ChartRepository> {
  TakeChart(super.repository);
}
